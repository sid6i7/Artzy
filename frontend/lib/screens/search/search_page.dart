import 'package:flutter/material.dart';
import 'package:frontend/models/artwork.dart';
import 'package:frontend/screens/artwork/artwork_page.dart';
import 'package:frontend/screens/common/header/header.dart';
import 'package:frontend/screens/gallery/profile/gallery_page_visit.dart';
import 'package:frontend/services/database/artwork_utils.dart';
import 'package:frontend/services/database/gallery_utils.dart';
import 'package:frontend/services/database/user_profile_utils.dart';

class SearchPage extends StatelessWidget {
  final List<ArtworkInstance> filteredArtworks;
  final String? query;
  const SearchPage(
      {super.key, required this.filteredArtworks, required this.query});

  @override
  Widget build(BuildContext context) {
    if (filteredArtworks.isEmpty) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  children: const [
                    Text("We couldn't find any results for your search.",
                        style: TextStyle(fontSize: 60, color: Colors.black)),
                    SizedBox(
                      height: 60,
                    ),
                    Text("Try searching for something else.",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                height: 1000,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // number of items per row
                    crossAxisCount: 4,
                    // vertical spacing between the items
                    mainAxisSpacing: 30,
                    // horizontal spacing between the items
                    crossAxisSpacing: 30,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: filteredArtworks.length,
                  itemBuilder: ((context, index) {
                    return Card(
                        child: Column(
                      children: [
                        Image.network(
                          filteredArtworks[index].imageUrl ?? "",
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
                                        artwork: filteredArtworks[index],
                                      )),
                                ));
                          },
                          label: Text(
                            filteredArtworks[index].title,
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
                                .getGallery(filteredArtworks[index].gallery);

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
                            filteredArtworks[index].gallery,
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
            )
          ],
        ),
      ),
    );
  }
}
