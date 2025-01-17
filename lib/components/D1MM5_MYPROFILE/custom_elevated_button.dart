import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/utils/color_constants.dart';
import '../../controllers/global_controller/custom_elevated_button_controller.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const CustomElevatedButton({
    super.key,
    this.text,
    this.color = const Color(0xFFB8FE22),
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 8,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ElevatedButtonController controller =
        Get.put(ElevatedButtonController());

    return GestureDetector(
      onTap: () {
        controller.buttonPressed();
        if (onTap != null) onTap!();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          text ?? '',
          style: textStyle ??
              TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorConstant.chineBlack,
              ),
        ),
      ),
    );
  }
}
