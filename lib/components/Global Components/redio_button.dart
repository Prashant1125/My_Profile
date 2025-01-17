import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_profile/utils/image_constants.dart';

import '../../controllers/global_controller/single_select_radio_controller.dart';

class RadioButtonTab extends StatefulWidget {
  const RadioButtonTab(
      {super.key,
      required this.buttonTexts,
      required this.buttonWidth,
      required this.buttonCount,
      required this.controller,
      required this.title});

  final List<String> buttonTexts;
  final double buttonWidth;
  final int buttonCount;
  final String title;
  final MembershipTypeRadioController controller;

  @override
  State<RadioButtonTab> createState() => _RadioButtonTabState();
}

class _RadioButtonTabState extends State<RadioButtonTab> {
  // final _membershipTypeRadioController = Get.put(MembershipTypeRadioController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: screenHeight * (45 / 800),
          width: screenWidth * (332 / 360),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.buttonCount,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    bool atCurrentIndexOrNot =
                        widget.controller.currentIndex.value == index;
                    return InkWell(
                      child: Container(
                        //duration: const Duration(milliseconds: 200),
                        height: screenHeight * (45 / 800),
                        width: widget.buttonWidth,

                        decoration: BoxDecoration(
                            color: atCurrentIndexOrNot
                                ? Colors.transparent
                                : const Color(0xFF2F5B6C),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: atCurrentIndexOrNot
                                    ? const Color(0xFFB8FE22)
                                    : Colors.transparent,
                                width: atCurrentIndexOrNot ? 1.5 : 0
                                //when clicked then green otherwise transparent

                                )),

                        child: Padding(
                          padding: EdgeInsets.all(atCurrentIndexOrNot ? 4 : 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: atCurrentIndexOrNot
                                  ? const Color(0xFF2F5B6C)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              //border: Border.all(color: Colors.red)
                            ),
                            //duration: const Duration(milliseconds: 200),
                            height: atCurrentIndexOrNot
                                ? screenHeight * (37 / 800)
                                : screenHeight * (45 / 800),
                            width: atCurrentIndexOrNot
                                ? widget.buttonWidth - 8
                                : widget.buttonWidth,
                            child: Row(
                              children: [
                                atCurrentIndexOrNot
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.5, horizontal: 6),
                                        child: SvgPicture.asset(
                                            ImageConstants.radioSelected),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 8,
                                            top: 15.5,
                                            bottom: 15.5),
                                        child: SvgPicture.asset(
                                            ImageConstants.radioUnselected),
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 8,
                                      top: 8,
                                      bottom: atCurrentIndexOrNot ? 11 : 8,
                                      left: atCurrentIndexOrNot ? 2.7 : 0),
                                  child: SizedBox(
                                    height: screenHeight * (21 / 800),
                                    child: Text(
                                      widget.buttonTexts[index],
                                      style: TextStyle(
                                          color: widget.controller.currentIndex
                                                      .value ==
                                                  index
                                              ? const Color(0xFFB8FE22)
                                              : const Color(0xFFF4F4F4),
                                          //if selected then changed to green
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        widget.controller
                            .updateIndex(index, widget.buttonTexts[index]);
                      },
                    );
                  }),
                  index + 1 != widget.buttonCount
                      ? const SizedBox(
                          width: 8,
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
