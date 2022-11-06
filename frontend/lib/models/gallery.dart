import 'package:frontend/models/artwork.dart';
import 'package:frontend/services/database/artwork_utils.dart';

abstract class Gallery {
  late String name;
  final String owner;
  late String? description;

  Gallery({
    required this.name,
    required this.owner,
    this.description,
  });

  get getName => name;

  set setName(name) => this.name = name;

  get getOwner => owner;

  get getDescription => description;

  set setDescription(description) => description = description;
}

class GalleryInstance extends Gallery {
  late String? profilePictureUrl;
  late String? bannerPictureUrl;
  late List<Artwork> artworks;

  get getProfilePictureUrl => profilePictureUrl;

  set setProfilePictureUrl(profilePictureUrl) =>
      profilePictureUrl = profilePictureUrl;

  get getBannerPictureUrl => bannerPictureUrl;

  set setBannerPictureUrl(bannerPictureUrl) =>
      this.bannerPictureUrl = bannerPictureUrl;

  get getArtworks => artworks;

  GalleryInstance({
    this.profilePictureUrl,
    this.bannerPictureUrl,
    required String name,
    required String owner,
    String? description,
  }) : super(
          name: name,
          owner: owner,
          description: description,
        );

  factory GalleryInstance.fromJson(Map<String, dynamic> json) {
    final base = "http://127.0.0.1:8000/";
    return GalleryInstance(
      name: json['name'],
      owner: json['owner'],
      description: json['description'],
      profilePictureUrl: base + json['profile_picture'],
      bannerPictureUrl: base + json['banner_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'description': description,
      'profile_picture': profilePictureUrl,
      'banner_picture': bannerPictureUrl,
    };
  }

  void addArtwork(Artwork artwork) {
    artworks.add(artwork);
  }

  void removeArtwork(Artwork artwork) {
    artworks.remove(artwork);
  }
}

class GalleryCreation extends Gallery {
  late List<int>? profilePicture;
  late List<int>? bannerPicture;
  late List<Artwork>? artworks;

  get getProfilePicture => profilePicture;

  set setProfilePicture(profilePicture) => this.profilePicture = profilePicture;

  get getBannerPicture => bannerPicture;

  set setBannerPicture(bannerPicture) => this.bannerPicture = bannerPicture;

  get getArtworks => artworks;

  set setArtworks(artworks) => this.artworks = artworks;

  GalleryCreation({
    this.profilePicture,
    this.bannerPicture,
    required String name,
    required String owner,
    String? description,
  }) : super(
          name: name,
          owner: owner,
          description: description,
        );

  GalleryInstance galleryInstanceFromGalleryCreation(
      Map<String, dynamic> json) {
    return GalleryInstance(
      name: json['name'],
      owner: json['owner'],
      description: json['description'],
      profilePictureUrl: json['profile_picture'],
      bannerPictureUrl: json['banner_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'owner': owner,
      'description': description,
      'profile_picture': profilePicture,
      'banner_picture': bannerPicture,
    };
  }
}
