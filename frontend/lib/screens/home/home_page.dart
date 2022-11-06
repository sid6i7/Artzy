import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/providers/artwork.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/artwork/artwork_page.dart';
import 'package:frontend/screens/common/header/header.dart';
import 'package:frontend/screens/gallery/profile/gallery_page_visit.dart';
import 'package:frontend/services/database/artwork_utils.dart';
import 'package:frontend/services/database/gallery_utils.dart';
import 'package:frontend/services/database/user_profile_utils.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  late List<ArtworkInstance> artworks = [];
  late List<ArtworkInstance> clothingShoes = [];
  late List<ArtworkInstance> toysEntertainment = [];
  late List<ArtworkInstance> artCollection = [];

  fetchHomePageContent() {
    artworks = ref.watch(homePageArtworksProvider);
    print(artworks.length);
    clothingShoes = artworks
        .where((element) =>
            element.category.name == "Clothing" ||
            element.category.name == "Shoes")
        .toList();

    toysEntertainment = artworks
        .where((element) =>
            element.category.name == "Toys" ||
            element.category.name == "Entertainment")
        .toList();

    artCollection = artworks
        .where((element) =>
            element.category.name == "Art" ||
            element.category.name == "Collectibles")
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    fetchHomePageContent();
    print('ok');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Clothing\n&\nShoes",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.1666666666666667,
                fontSize: 60.0,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 2, 1),

                /* letterSpacing: -0.800000011920929, */
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: clothingShoes.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: Column(
                    children: [
                      Image.network(
                        clothingShoes[index].imageUrl ?? "",
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.format_paint,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ArtworkPage(
                                      artwork: clothingShoes[index],
                                    )),
                              ));
                        },
                        label: Text(
                          clothingShoes[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          final gallery = await GalleryUtils()
                              .getGallery(clothingShoes[index].gallery);
                          final artworks = await ArtworkUtils()
                              .getAllArtWorksOfGallery(gallery.name);
                          final artist = await UserProfileUtils()
                              .getUserProfileFromDatabase(gallery.owner);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => VisitedGalleryPage(
                                      gallery: gallery,
                                      artworks: artworks,
                                      artist: artist,
                                    )),
                              ));
                        },
                        icon: const Icon(
                          Icons.palette_outlined,
                          size: 30,
                        ),
                        label: Text(
                          clothingShoes[index].gallery,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 400,
                      )
                    ],
                  ));
                }),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Toys\n&\nEntertainment",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.1666666666666667,
                fontSize: 60.0,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 2, 1),

                /* letterSpacing: -0.800000011920929, */
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toysEntertainment.length,
                itemBuilder: ((context, index) {
                  return Card(
                      child: Column(
                    children: [
                      Image.network(
                        toysEntertainment[index].imageUrl ?? "",
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.format_paint,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ArtworkPage(
                                      artwork: toysEntertainment[index],
                                    )),
                              ));
                        },
                        label: Text(
                          toysEntertainment[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          final gallery = await GalleryUtils()
                              .getGallery(toysEntertainment[index].gallery);
                          final artworks = await ArtworkUtils()
                              .getAllArtWorksOfGallery(gallery.name);
                          final artist = await UserProfileUtils()
                              .getUserProfileFromDatabase(gallery.owner);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => VisitedGalleryPage(
                                      gallery: gallery,
                                      artist: artist,
                                      artworks: artworks,
                                    )),
                              ));
                        },
                        icon: const Icon(
                          Icons.palette_outlined,
                          size: 30,
                        ),
                        label: Text(
                          toysEntertainment[index].gallery,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 400,
                      )
                    ],
                  ));
                }),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Art\n&\nCollectibles",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.1666666666666667,
                fontSize: 60.0,
                fontFamily: 'Archivo-regular',
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 0, 2, 1),

                /* letterSpacing: -0.800000011920929, */
              ),
            ),
            SizedBox(
                height: 600,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: artCollection.length,
                  itemBuilder: ((context, index) {
                    return Card(
                        child: Column(
                      children: [
                        Image.network(
                          artCollection[index].imageUrl ?? "",
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton.icon(
                          icon: const Icon(
                            Icons.format_paint,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ArtworkPage(
                                        artwork: artCollection[index],
                                      )),
                                ));
                          },
                          label: Text(
                            artCollection[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            final gallery = await GalleryUtils()
                                .getGallery(artCollection[index].gallery);
                            final artworks = await ArtworkUtils()
                                .getAllArtWorksOfGallery(gallery.name);
                            final artist = await UserProfileUtils()
                                .getUserProfileFromDatabase(gallery.owner);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => VisitedGalleryPage(
                                        gallery: gallery,
                                        artist: artist,
                                        artworks: artworks,
                                      )),
                                ));
                          },
                          icon: const Icon(
                            Icons.palette_outlined,
                            size: 30,
                          ),
                          label: Text(
                            artCollection[index].gallery,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                        )
                      ],
                    ));
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
