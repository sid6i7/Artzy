import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker_web/image_picker_web.dart';

Future<List<int>?> pickImage() async {
  var bytes = await ImagePickerWeb.getImageAsBytes();
  return bytes!.toList();
}

Future uploadImage(image) async {
  final url = Uri.parse("http://127.0.0.1:8000/profile/");

  var request = http.MultipartRequest("POST", url);
  var picture = http.MultipartFile.fromBytes(
    'picture',
    image!,
    filename: "pic.png",
    contentType: (MediaType('image', 'png')),
  );
  request.files.add(picture);
  await request.send().then((response) async {
    if (response.statusCode == 200) {
      print('uploaded');
    } else {
      print(await response.stream.bytesToString());
    }
  });
}
