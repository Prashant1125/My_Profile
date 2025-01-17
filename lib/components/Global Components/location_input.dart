import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/location_input_controller.dart';

class LocationInputField extends StatelessWidget {
  final LocationInputController controller = Get.put(LocationInputController());
  final String hintText;
  final String title;
  final TextStyle? hintStyle;

  LocationInputField(
      {super.key, required this.hintText, this.hintStyle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: controller.textEditingController,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.0,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFBDBDBD),
                ),
            filled: true,
            fillColor: const Color(0xFF2F5B6C),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFB8FE22)),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.location_pin, color: Colors.white),
              onPressed: () async {
                String location = await controller.pickLocation(context);
                controller.textEditingController.text = location;
              },
            ),
          ),
        ),
      ],
    );
  }
}
