import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/text_input.dart';

class TextInputField extends StatefulWidget {
  const TextInputField(
      {super.key,
      required this.enabled,
      required this.textEditingController,
      required this.hintText,
      required this.uniqueTextInputFieldId,
      this.width,
      this.title,
      this.title2});

  final TextEditingController textEditingController;
  final String hintText;
  final String? title;
  final String? title2;
  final String uniqueTextInputFieldId;
  final bool enabled;
  final double? width;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final _textInputFieldController = Get.put(TextInputFieldController());
  final RxBool _isEmpty = true.obs; // Tracks whether the field is empty.

  @override
  void initState() {
    super.initState();
    // Add a listener to track text changes
    widget.textEditingController.addListener(() {
      _isEmpty.value = widget.textEditingController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                text: widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.title2,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          bool focusedOrNot = _textInputFieldController
              .isFieldFocused(widget.uniqueTextInputFieldId);

          return GestureDetector(
            onTap: () {
              if (widget.enabled) {
                _textInputFieldController
                    .requestFocus(widget.uniqueTextInputFieldId);
              } else {
                // print('it is false**********************************');
              }
            },
            child: widget.enabled
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: widget.width ?? 326,
                    height: 45,
                    decoration: BoxDecoration(
                      color: focusedOrNot
                          ? Colors.transparent
                          : const Color(0xFF2F5B6C),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _isEmpty.value
                            ? const Color(0xFFDF0030) // Red border when empty
                            : (focusedOrNot
                                ? const Color(
                                    0xFFB8FE22) // Green border when focused
                                : Colors.transparent), // Default border
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: focusedOrNot
                            ? (widget.width ?? 318)
                            : (widget.width ?? 326),
                        height: focusedOrNot ? 37 : 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F5B6C),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          cursorColor: const Color(0xFFF4F4F4),
                          cursorHeight: 15,
                          controller: widget.textEditingController,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins'),
                            hintText: focusedOrNot ? '' : widget.hintText,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                bottom: focusedOrNot ? 13 : 14,
                                left: focusedOrNot ? 19 : 20,
                                top: 12,
                                right: 20),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                          onTap: () {
                            _textInputFieldController
                                .requestFocus(widget.uniqueTextInputFieldId);
                          },
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: (20 / 800) * deviceHeight),
                    child: Container(
                      height: deviceHeight * (45 / 800),
                      width: widget.width ?? 326,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xFF2F5B6C),
                      ),
                      child: TextField(
                        enabled: false,
                        cursorColor: Colors.white10,
                        cursorHeight: 6,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              bottom: 12, left: 20, top: 12, right: 20),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0.3, color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 2,
                          ),
                          errorText: '',
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFDF0030),
                              width: 1.5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 1,
                          ),
                          enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              strokeAlign: 2,
                              width: 1.5,
                              style: BorderStyle.solid,
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.5,
                                  strokeAlign: 2,
                                  color: Color(0xFFB8FE22),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8),
                              gapPadding: 2),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        maxLength: 30,
                        buildCounter: (context,
                            {required currentLength,
                            required isFocused,
                            required maxLength}) {
                          return null;
                        },
                      ),
                    ),
                  ),
          );
        }),
      ],
    );
  }
}
