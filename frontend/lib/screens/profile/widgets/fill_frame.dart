import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/config.dart';
import 'package:frontend/helpers/svg/svg.dart';
import 'package:frontend/helpers/transform/transform.dart';
import 'package:frontend/providers/fill_frame_providers.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/screens/profile/widgets/gender_dropdown.dart';

class DetailsFill extends ConsumerStatefulWidget {
  const DetailsFill({super.key});

  @override
  ConsumerState<DetailsFill> createState() => _DetailsFillState();
}

class _DetailsFillState extends ConsumerState<DetailsFill> {
  late TextEditingController _addressController;
  late TextEditingController _bioController;

  @override
  Widget build(BuildContext context) {
    final request = ref.watch(currentUserProfileProvider);
    return request.when(
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      data: (data) {
        final profile = data;
        _addressController = TextEditingController(text: profile.address ?? "");
        _bioController = TextEditingController(text: profile.bio ?? "");
        return SizedBox(
          width: 1095.0,
          height: 986.0,
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
                  width: 1095.0,
                  height: 986.0,
                  child: SizedBox(
                    width: 1095.0,
                    height: 986.0,
                    child: SvgWidget(painters: [
                      SvgPathPainter.fill()
                        ..addPath('M0 0L1095 0L1095 986L0 986L0 0Z')
                        ..color = const Color.fromARGB(255, 217, 217, 217),
                    ]),
                  ),
                ),
                Positioned(
                  left: 191.0,
                  top: 365.0,
                  right: null,
                  bottom: null,
                  width: 826.0,
                  height: 567.0,
                  child: Container(
                    width: 826.0,
                    height: 567.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.88508415222168),
                    ),
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 131.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 695.0,
                            height: 567.0,
                            child: Container(
                              width: 695.0,
                              height: 567.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      ref
                                          .read(fillBioFieldProvider.notifier)
                                          .state = value;
                                    },
                                    controller: _bioController,
                                    maxLines: null,
                                    style: const TextStyle(
                                      fontSize: 28,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Tell us about yourself"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: null,
                            right: null,
                            bottom: null,
                            width: 57.0,
                            height: 48.0,
                            child: TransformHelper.translate(
                                x: 0.00,
                                y: 3.50,
                                z: 0,
                                child: const Text(
                                  '''Bio''',
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.1718749841148417,
                                    fontSize: 33.77000045776367,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 2, 1),

                                    /* letterSpacing: -0.3934426009654999, */
                                  ),
                                )),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  left: 56.0,
                  top: 306.0,
                  right: null,
                  bottom: null,
                  width: 995.0,
                  height: 1.0,
                  child: TransformHelper.rotate(
                      a: 1.00,
                      b: 0.00,
                      c: -0.00,
                      d: 1.00,
                      child: SizedBox(
                        width: 995.0,
                        height: 1.0,
                        child: SvgWidget(painters: [
                          SvgPathPainter.stroke(
                            1.0,
                            strokeJoin: StrokeJoin.miter,
                          )
                            ..addPath('M0 0L995 0L995 -1L0 -1L0 0Z')
                            ..color = Color.fromARGB(255, 157, 150, 144),
                        ]),
                      )),
                ),
                Positioned(
                  left: 152.0,
                  top: 211.0,
                  right: null,
                  bottom: null,
                  width: 865.0,
                  height: 60.0,
                  child: Container(
                    width: 865.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.88508415222168),
                    ),
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 170.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 695.0,
                            height: 60.0,
                            child: Container(
                              width: 695.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 5),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      print(value);
                                      ref
                                          .read(
                                              fillAddressFieldProvider.notifier)
                                          .state = value;
                                    },
                                    controller: _addressController,
                                    style: const TextStyle(
                                      fontSize: 28,
                                    ),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Where are you from?"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: null,
                            right: null,
                            bottom: null,
                            width: 135.0,
                            height: 48.0,
                            child: TransformHelper.translate(
                                x: 0.00,
                                y: 2.00,
                                z: 0,
                                child: const Text(
                                  '''Address''',
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.1718749841148417,
                                    fontSize: 33.77000045776367,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 2, 1),

                                    /* letterSpacing: -0.3934426009654999, */
                                  ),
                                )),
                          )
                        ]),
                  ),
                ),
                Positioned(
                  left: 56.0,
                  top: 176.0,
                  right: null,
                  bottom: null,
                  width: 995.0,
                  height: 1.0,
                  child: TransformHelper.rotate(
                      a: 1.00,
                      b: 0.00,
                      c: -0.00,
                      d: 1.00,
                      child: SizedBox(
                        width: 995.0,
                        height: 1.0,
                        child: SvgWidget(painters: [
                          SvgPathPainter.stroke(
                            1.0,
                            strokeJoin: StrokeJoin.miter,
                          )
                            ..addPath('M0 0L995 0L995 -1L0 -1L0 0Z')
                            ..color = Color.fromARGB(255, 157, 150, 144),
                        ]),
                      )),
                ),
                Positioned(
                  left: 159.0,
                  top: 57.0,
                  right: null,
                  bottom: null,
                  width: 858.0,
                  height: 60.0,
                  child: Container(
                    width: 858.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.88508415222168),
                    ),
                    child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 163.0,
                            top: 0.0,
                            right: null,
                            bottom: null,
                            width: 695.0,
                            height: 60.0,
                            child: Container(
                              width: 695.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(18.88508415222168),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: GenderDropDownWidget(
                                    gender: genderMap.keys.firstWhere(
                                        (k) => genderMap[k] == profile.gender),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            top: null,
                            right: null,
                            bottom: null,
                            width: 121.0,
                            height: 48.0,
                            child: TransformHelper.translate(
                                x: 0.00,
                                y: 6.00,
                                z: 0,
                                child: const Text(
                                  '''Gender''',
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.1718749841148417,
                                    fontSize: 33.77000045776367,
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 0, 2, 1),

                                    /* letterSpacing: -0.3934426009654999, */
                                  ),
                                )),
                          )
                        ]),
                  ),
                )
              ]),
        );
      },
    );
  }
}
