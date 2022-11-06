import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/fill_frame_providers.dart';

class GenderDropDownWidget extends ConsumerStatefulWidget {
  late String gender;
  GenderDropDownWidget({super.key, required this.gender});

  @override
  ConsumerState<GenderDropDownWidget> createState() =>
      _GenderDropDownWidgetState();
}

class _GenderDropDownWidgetState extends ConsumerState<GenderDropDownWidget> {
  var genders = [
    'Prefer not to say',
    'Male',
    'Female',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: const SizedBox(),
      style: const TextStyle(
        fontSize: 28,
      ),
      // Initial Value
      value: widget.gender,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: genders.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (newGender) {
        ref.watch(fillGenderFieldProvider.notifier).state = newGender;
        setState(() {
          widget.gender = newGender!;
        });
      },
    );
  }
}
