import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cheak_box_controller.dart';

class CustomCheckboxWidget extends StatelessWidget {
  final String statement;
  final CheckboxController controller;

  const CustomCheckboxWidget(
      {super.key, required this.statement, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: controller.toggleCheckbox,
          child: Obx(
            () => Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: controller.isChecked.value
                    ? const Color(0xFF55A6C4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white),
              ),
              child: controller.isChecked.value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            statement,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
