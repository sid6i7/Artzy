import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/models/gallery.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class GalleryUtils {
  Future<GalleryInstance> getGalleryFromArtistName(String artistName) async {
    final url = BASE_URL + GALLERY_BY_OWNER_NAME_ENDPOINT + artistName + "/";
    print(url);
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return GalleryInstance.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<GalleryInstance> getGallery(String gName) async {
    final url = BASE_URL + GALLERY_ENDPOINT + gName + "/";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return GalleryInstance.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<bool> createGallery(GalleryCreation gallery) async {
    const url = BASE_URL + GALLERY_ENDPOINT;
    final request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields['name'] = gallery.name;
    request.fields['owner'] = gallery.owner;
    request.fields['description'] = gallery.description ?? "";
    request.files.add(http.MultipartFile.fromBytes(
        'profile_picture', gallery.profilePicture!,
        filename: "${gallery.name}_profile.png",
        contentType: (MediaType('image.png', 'png'))));
    request.files.add(http.MultipartFile.fromBytes(
        'banner_picture', gallery.bannerPicture!,
        filename: "${gallery.name}_banner.png",
        contentType: (MediaType('image.png', 'png'))));

    await request.send().then((response) async {
      if (response.statusCode == 201) {
        print('gallery created');
        return true;
      } else {
        print('gallery not created');
        print(await response.stream.bytesToString());
        return false;
      }
    });
    return false;
  }

  updateGallery(GalleryInstance gallery) async {
    const url = BASE_URL + GALLERY_ENDPOINT;
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(gallery.toJson()),
    );
    return response.body;
  }

  deleteGallery(String galleryName) async {
    const url = BASE_URL + GALLERY_ENDPOINT;
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(galleryName),
    );
    return response.body;
  }
}
