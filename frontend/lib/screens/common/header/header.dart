import 'package:flutter/material.dart';
import 'package:frontend/helpers/svg/svg.dart';
import 'package:frontend/helpers/transform/transform.dart';
import 'package:frontend/screens/common/header/artzy_logo.dart';
import 'package:frontend/screens/common/header/drop_down_menu.dart';
import 'package:frontend/screens/common/header/profile_button.dart';
import 'package:frontend/screens/common/header/quote.dart';
import 'package:frontend/screens/common/header/search.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 1920.0,
        height: 300.5901794433594,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                left: 563.4080200195312,
                top: 116.45906066894531,
                right: null,
                bottom: null,
                width: 897.0490112304688,
                height: 27.000015258789062,
                child: DropDownMenuWidget(),
              ),
              const Positioned(
                left: 330.491455078125,
                top: 17.31149673461914,
                right: null,
                bottom: null,
                width: 1175.6065673828125,
                height: 61.377044677734375,
                child: SearchBarWidget(),
              ),
              const Positioned(
                left: 113.31257629394531,
                top: 0.000010117772035300732,
                right: null,
                bottom: null,
                width: 160.52459716796875,
                height: 78.68852233886719,
                child: ArtzyLogoWidget(),
              ),
              const Positioned(
                left: 0.0,
                top: 180.983642578125,
                right: null,
                bottom: null,
                width: 1920.0,
                height: 119.60655975341797,
                child: QuoteWidget(),
              ),
              const Positioned(
                left: 1556.0,
                top: 19.0,
                right: null,
                bottom: null,
                width: 100.78688049316406,
                height: 58.22951126098633,
                child: ProfileButtonWidget(),
              ),
              Positioned(
                left: 0.0,
                top: 10.0,
                right: 150.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 0.028688526153564452;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 55.08197021484375;

                  double percentHeight = 0.16770823369025312;
                  double scaleY = (constraints.maxHeight * percentHeight) /
                      59.42915344238281;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: constraints.maxWidth * 0.9619791666666667,
                        translateY: constraints.maxHeight * 0.05988219586326095,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: SizedBox(
                          width: 55.08197021484375,
                          height: 59.42915344238281,
                          child: SvgWidget(painters: [
                            SvgPathPainter.fill()
                              ..addPath(
                                  'M27.5432 4.91566C34.0125 -1.86476 44.0097 -1.63971 50.2421 5.64868C56.4717 12.9403 56.6866 24.5529 50.892 32.1274L27.5377 59.4292L4.18892 32.1274C-1.60559 24.5529 -1.38802 12.921 4.83888 5.64868C11.0768 -1.63007 21.0547 -1.87441 27.5432 4.91566L27.5432 4.91566ZM46.3424 10.1915C42.2113 5.36255 35.5465 5.16644 31.2226 9.69958L27.546 13.5511L23.8666 9.7028C19.529 5.16322 12.8779 5.36255 8.73585 10.1979C4.63232 14.9882 4.42577 22.656 8.20708 27.7229L27.5405 50.3275L46.8739 27.7261C50.658 22.656 50.4514 14.9979 46.3424 10.1915L46.3424 10.1915Z')
                              ..color = const Color.fromARGB(255, 0, 0, 0),
                          ]),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
