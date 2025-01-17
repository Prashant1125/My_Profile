import 'package:flutter/material.dart';
import 'package:my_profile/utils/color_constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final double? height;
  final double? width;
  final String? title;

  final dynamic maxDigits;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.height,
    this.width,
    this.maxDigits,
    required this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: ColorConstant.pureWhite,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            maxLength: widget.maxDigits,
            controller: widget.controller,
            obscureText: widget.isObscure,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFF4F4F4),
                fontSize: 14,
                fontFamily: 'Poppins',
                height: 0,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.5,
                ),
              ),
              counterText: "",
            ),
          ),
        ),
      ],
    );
  }
}
