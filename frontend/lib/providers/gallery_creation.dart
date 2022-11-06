import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/category.dart';

final galleryCreationGalleryNameProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

final galleryCreationGalleryDescriptionProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

final galleryCreationArtworkTitleProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

class ArtworkCategoryNotifier extends StateNotifier<List<Category>> {
  ArtworkCategoryNotifier() : super([]);

  void addCategory(Category category) {
    state = [...state, category];
  }

  void removeCategory(Category category) {
    state = [
      for (final value in state)
        if (value != category) value,
    ];
  }

  List<Category> getCategories() {
    return state;
  }
}

final artworkCategoryProvider =
    StateNotifierProvider<ArtworkCategoryNotifier, List<Category>>(
  (ref) {
    return ArtworkCategoryNotifier();
  },
);

final galleryCreationArtworkDescriptionProvider = StateProvider<String?>(
  (ref) {
    return null;
  },
);

class ImageNotifier extends StateNotifier<List<int>?> {
  ImageNotifier() : super([]);

  void setImage(List<int>? image) {
    state = image;
  }

  List<int>? getImage() {
    return state;
  }
}

final galleryCreationProfilePhotoProvider =
    StateNotifierProvider<ImageNotifier, List<int>?>(
  (ref) {
    return ImageNotifier();
  },
);

final galleryCreationBannerPhotoProvider =
    StateNotifierProvider<ImageNotifier, List<int>?>(
  (ref) {
    return ImageNotifier();
  },
);

final galleryCreationArtworkPictureProvider =
    StateNotifierProvider<ImageNotifier, List<int>?>(
  (ref) {
    return ImageNotifier();
  },
);
