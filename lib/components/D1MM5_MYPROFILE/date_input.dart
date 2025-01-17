// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/date_input_controller.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    required this.enabled,
    required this.hintText,
    required this.uniqueTextInputFieldId,
    this.width,
    required this.isEmpty,
    required this.title,
  });

  final String hintText;
  final String title;
  final String uniqueTextInputFieldId;
  final bool enabled;
  final double? width;
  final RxBool isEmpty;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final DateInputController datecontroller = Get.put(DateInputController());
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title.toString(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.put(DateInputController()).removeFocus(); // Deselect the box
          },
          child: Obx(() {
            bool focusedOrNot = Get.put(DateInputController())
                .isFieldFocused(widget.uniqueTextInputFieldId);
            bool isValid = Get.put(DateInputController())
                .isValidDOB
                .value; // Observe DOB validity

            return GestureDetector(
              onTap: () {
                if (widget.enabled) {
                  Get.put(DateInputController())
                      .requestFocus(widget.uniqueTextInputFieldId);
                  _focusNode.requestFocus();
                } else {
                  FocusScope.of(context).unfocus();
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
                          color: !isValid
                              ? Colors.red // Red border for invalid DOB
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
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F5B6C),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            focusNode: _focusNode,
                            cursorColor: const Color(0xFFF4F4F4),
                            cursorHeight: 15,
                            controller: datecontroller.textEditingController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'Poppins'),
                              hintText: focusedOrNot ? '' : widget.hintText,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today,
                                    color: Colors.white),
                                onPressed: () {
                                  datecontroller.selectDate(context);
                                },
                              ),
                              counterText: "",
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            onTap: () {
                              datecontroller
                                  .requestFocus(widget.uniqueTextInputFieldId);
                            },
                            onChanged: (value) {
                              datecontroller.formatDate(
                                  value); // Validate manually entered DOB
                            },
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding:
                          EdgeInsets.only(bottom: (20 / 800) * deviceHeight),
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
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 0.3, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              onPressed: () {
                                datecontroller.selectDate(context);
                              },
                            ),
                            counterText: "",
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            );
          }),
        ),
      ],
    );
  }
}
