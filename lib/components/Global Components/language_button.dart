import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/global_controller/language_button_controller.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton(
      {super.key,
      this.buttonWidth,
      required this.buttonHeight,
      required this.buttonText,
      required this.uniqueButtonId,
      required this.onTap});

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final String uniqueButtonId;
  final VoidCallback onTap;

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  final _languageButtonsController = Get.put(LanguageButtonsController());

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: widget.buttonWidth ?? 160 / 360 * deviceWidth,
          height: widget.buttonHeight / 800 * deviceHeight,
          decoration: BoxDecoration(
            color: _languageButtonsController.isSelected(widget.uniqueButtonId)
                ? Colors.transparent
                : const Color(0xFF2F5B6C),
            borderRadius: BorderRadius.circular(8),
            border: _languageButtonsController.isSelected(widget.uniqueButtonId)
                ? Border.all(color: const Color(0xFFB8FE22), width: 1.5)
                : Border.all(
                    color: Colors.transparent,
                    width: 0,
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              _languageButtonsController.isSelected(widget.uniqueButtonId)
                  ? 2.5 / 360 * deviceWidth
                  : 4 / 360 * deviceWidth,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: (widget.buttonWidth ?? 160 - 8) / 360 * deviceWidth,
              height: (widget.buttonHeight - 8) / 720 * deviceHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF2F5B6C),
                borderRadius: BorderRadius.circular(4 / 360 * deviceWidth),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8 / 720 * deviceHeight,
                  horizontal: 16 / 360 * deviceWidth,
                ),
                child: Text(
                  widget.buttonText,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _languageButtonsController
                            .isSelected(widget.uniqueButtonId)
                        ? const Color(0xFFB8FE22)
                        : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
