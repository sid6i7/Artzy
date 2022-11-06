import 'package:frontend/models/category.dart';

abstract class Artwork {
  final String gallery;
  late String title;
  late String? description;
  late Category category;

  get getGallery => gallery;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getCategory => category;

  set setCategories(categories) => this.category = categories;

  Artwork({
    required this.gallery,
    required this.title,
    this.description,
    required this.category,
  });
}

class ArtworkCreation extends Artwork {
  final List<int>? image;

  ArtworkCreation({
    required String gallery,
    required String title,
    String? description,
    required Category category,
    this.image,
  }) : super(
          gallery: gallery,
          title: title,
          description: description,
          category: category,
        );

  ArtworkInstance getArtworkInstanceFromArtworkCreation(
      Map<String, dynamic> json) {
    return ArtworkInstance(
      gallery: json['gallery'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gallery': gallery,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}

class ArtworkInstance extends Artwork {
  final String? imageUrl;

  ArtworkInstance({
    required String gallery,
    required String title,
    String? description,
    required Category category,
    this.imageUrl,
  }) : super(
          gallery: gallery,
          title: title,
          description: description,
          category: category,
        );

  factory ArtworkInstance.fromJson(Map<String, dynamic> json) {
    if (json['image'] != null) {
      if (!json['image'].contains('http')) {
        json['image'] = "http://127.0.0.1:8000/" + json['image'];
      }
    }

    return ArtworkInstance(
      gallery: json['gallery'],
      title: json['title'],
      description: json['description'],
      category: Category(name: json['category']),
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gallery': gallery,
      'title': title,
      'description': description,
      'category': category,
      'image': imageUrl,
    };
  }
}
