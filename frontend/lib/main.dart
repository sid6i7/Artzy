import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/routes.dart';
import 'package:frontend/screens/artwork/artwork_page.dart';
import 'package:frontend/screens/gallery/creation/about/about.dart';
import 'package:frontend/screens/gallery/creation/artwork/artwork.dart';
import 'package:frontend/screens/gallery/creation/profile/profile.dart';
import 'package:frontend/screens/gallery/creation/get_started_page.dart';
import 'package:frontend/screens/gallery/profile/gallery.dart';
import 'package:frontend/screens/gallery/profile/gallery_page_visit.dart';
import 'package:frontend/screens/home/home_page.dart';
import 'package:frontend/screens/login/login_page.dart';
import 'package:frontend/screens/profile/profile_page.dart';
import 'package:frontend/screens/register/register_page.dart';
import 'package:frontend/screens/start/start_page.dart';

import 'screens/add_artwork/add_artwork_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: "Artzy",
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: START_ROUTE,
        routes: {
          START_ROUTE: (context) => const StartPage(),
          LOGIN_ROUTE: (context) => const LoginPage(),
          REGISTER_ROUTE: (context) => const RegisterPage(),
          HOME_ROUTE: (context) => const HomePage(),
          PROFILE_ROUTE: (context) => ProfilePage(),
          GET_STARTED_ROUTE: (context) => const GetStartedPage(),
          GALLERY_CREATION_ABOUT_ROUTE: (context) =>
              const GalleryCreationAboutPage(),
          GALLERY_CREATION_PROFILE_ROUTE: (context) =>
              const GalleryCreationProfilePage(),
          GALLERY_CREATION_ARTWORK_ROUTE: (context) =>
              const GalleryCreationArtworkPage(),
          GALLERY_ROUTE: (context) => const GalleryProfile(),
          ARTWORK_CREATION_ROUTE: (context) => const AddArtworkPage(),
          ARTWORK_ROUTE: (context) => const ArtworkPage(),
          GALLERY_VISITED_ROUTE: (context) => VisitedGalleryPage(
                gallery: null,
                artist: null,
                artworks: [],
              ),
        },
      ),
    ),
  );
}
