import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/screens/search/search_page.dart';
import 'package:frontend/services/database/artwork_utils.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1175.6065673828125,
      height: 61.377044677734375,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: null,
              bottom: null,
              width: 1175.6065673828125,
              height: 61.377044677734375,
              child: SizedBox(
                width: 1175.6065673828125,
                height: 61.377044677734375,
                child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -0.0030913017690181732,
                        top: -0.00010168433072976768,
                        right: null,
                        bottom: null,
                        width: 1175.6065673828125,
                        height: 61.377044677734375,
                        child: Container(
                          width: 1175.6065673828125,
                          height: 61.377044677734375,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(18.88524627685547),
                          ),
                          child: Stack(
                              fit: StackFit.expand,
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 0.0,
                                  top: 0.0,
                                  right: null,
                                  bottom: null,
                                  width: 1175.6065673828125,
                                  height: 61.377044677734375,
                                  child: Container(
                                    width: 1175.6065673828125,
                                    height: 61.377044677734375,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          18.88524627685547),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(63, 0, 0, 0),
                                          offset:
                                              Offset(0.0, 6.295081615447998),
                                          blurRadius: 6.295081615447998,
                                        )
                                      ],
                                    ),
                                    child: Stack(
                                        fit: StackFit.expand,
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            left: 0.0,
                                            top: 0.0,
                                            right: null,
                                            bottom: null,
                                            width: 1175.6065673828125,
                                            height: 61.377044677734375,
                                            child: Container(
                                              width: 1175.6065673828125,
                                              height: 61.377044677734375,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.88524627685547),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.88524627685547),
                                                child: Container(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 62.62224578857422,
                                            top: 15.737693786621094,
                                            right: null,
                                            bottom: null,
                                            width: 992.5835571289062,
                                            height: 32.0,
                                            child: TextFormField(
                                              onFieldSubmitted: (value) async {
                                                final artworks =
                                                    await ArtworkUtils()
                                                        .searchArtwork(value);
                                                print(artworks.length);
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SearchPage(
                                                      filteredArtworks:
                                                          artworks,
                                                      query: value,
                                                    ),
                                                  ),
                                                );
                                              },
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                height: 1.1718750319560076,
                                                fontSize: 25.180326461791992,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),

                                                /* letterSpacing: 0.0, */
                                              ),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    '''Seach for Anything....''',
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                )
                              ]),
                        ),
                      )
                    ]),
              ),
            )
          ]),
    );
  }
}
