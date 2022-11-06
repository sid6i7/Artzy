import 'dart:convert';

import 'package:frontend/config.dart';
import 'package:frontend/models/artwork.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ArtworkUtils {
  Future<List<ArtworkInstance>> searchArtwork(String query) async {
    final url = BASE_URL + SEARCH_ENDPOINT + query + "/";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<ArtworkInstance> artworks =
          data.map((e) => ArtworkInstance.fromJson(e)).toList();
      return artworks;
    } else {
      throw Exception('Failed to load artworks');
    }
  }

  Future<bool> createArtwork(ArtworkCreation artwork) async {
    const url = BASE_URL + ARTWORK_ENDPOINT;
    final request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields['gallery'] = artwork.gallery;
    request.fields['title'] = artwork.title;
    request.fields['description'] = artwork.description ?? "";
    request.fields['category'] = artwork.category.getName;
    request.files.add(
      http.MultipartFile.fromBytes(
        "image",
        artwork.image ?? [],
        filename: "${artwork.title}_${artwork.gallery}.png",
        contentType: (MediaType('image.png', 'png')),
      ),
    );
    await request.send().then((response) async {
      if (response.statusCode == 201) {
        print('artwork created');
        return true;
      } else {
        print('artwork not created');
        print(await response.stream.bytesToString());
        return false;
      }
    });
    return false;
  }

  deleteArtwork(String artworkName) async {
    const url = BASE_URL + ARTWORK_ENDPOINT;
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(artworkName),
    );
    return response.body;
  }

  updateArtwork(ArtworkInstance artwork) async {
    const url = BASE_URL + ARTWORK_ENDPOINT;
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(artwork.toJson()),
    );
    return response.body;
  }

  Future<List<ArtworkInstance>> getAllArtWorksOfGallery(String name) async {
    final url = BASE_URL + "gallery/" + "artworks/" + name + "/";
    final response = await http.get(Uri.parse(url));
    late List<ArtworkInstance> artworks = [];
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      artworks =
          body.map((dynamic item) => ArtworkInstance.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load artworks');
    }

    return artworks;
  }

  Future<List<ArtworkInstance>> getAllArtWorks() async {
    final url = BASE_URL + ARTWORK_ENDPOINT;
    final response = await http.get(Uri.parse(url));
    print(response.body);
    late List<ArtworkInstance> artworks = [];
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      artworks =
          body.map((dynamic item) => ArtworkInstance.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load artworks');
    }

    return artworks;
  }
}
