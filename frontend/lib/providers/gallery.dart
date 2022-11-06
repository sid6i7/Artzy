import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/gallery.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/services/database/gallery_utils.dart';

class GalleryNotifier extends StateNotifier<GalleryInstance?> {
  GalleryNotifier(String? artistName) : super(null) {
    fetchGallery(artistName);
  }

  fetchGallery(String? artistName) async {
    state = await GalleryUtils().getGalleryFromArtistName(artistName ?? "");
  }
}

final galleryProvider =
    StateNotifierProvider<GalleryNotifier, GalleryInstance?>(
  (ref) {
    String? artistName = ref.watch(currentUserProvider)?.username;
    return GalleryNotifier(artistName);
  },
);
