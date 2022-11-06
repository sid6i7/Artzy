import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/providers/gallery.dart';
import 'package:frontend/services/database/artwork_utils.dart';

class HomeArtworksNotifier extends StateNotifier<List<ArtworkInstance>> {
  HomeArtworksNotifier() : super([]) {
    fetchArtworks();
  }

  addArtwork(ArtworkInstance artwork) {
    state = [...state, artwork];
  }

  removeArtwork(ArtworkInstance artwork) {
    state = state.where((element) => element.title != artwork.title).toList();
  }

  fetchArtworks() async {
    state = await ArtworkUtils().getAllArtWorks();
    print(state);
  }
}

final homePageArtworksProvider =
    StateNotifierProvider<HomeArtworksNotifier, List<ArtworkInstance>>(
  (ref) {
    return HomeArtworksNotifier();
  },
);

class ArtistArtworksNotifier extends StateNotifier<List<ArtworkInstance>> {
  ArtistArtworksNotifier(String? galleryName) : super([]) {
    fetchArtworks(galleryName);
  }

  addArtwork(ArtworkInstance artwork) {
    state = [...state, artwork];
  }

  removeArtwork(ArtworkInstance artwork) {
    state = state.where((element) => element.title != artwork.title).toList();
  }

  fetchArtworks(String? galleryName) async {
    state = await ArtworkUtils().getAllArtWorksOfGallery(galleryName ?? "");
  }
}

final artistArtworksProvider =
    StateNotifierProvider<ArtistArtworksNotifier, List<ArtworkInstance>>(
  (ref) {
    final gallery = ref.watch(galleryProvider);
    return ArtistArtworksNotifier(gallery?.name);
  },
);
