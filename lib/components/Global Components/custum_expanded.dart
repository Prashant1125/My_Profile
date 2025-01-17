import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/global_controller/cutum_dropdown_controller.dart';

class CustomExpandedDropdown extends StatefulWidget {
  final ExpandedDropdownController controller;
  final String hintText;
  final String title;
  final double buttonWidth;
  final double buttonHeight;
  final List<String> listOfItems;
  final List<String> listOfItemsUniqueId;

  const CustomExpandedDropdown({
    super.key,
    required this.controller,
    required this.buttonWidth,
    this.hintText = "Select an option",
    required this.buttonHeight,
    required this.listOfItems,
    required this.listOfItemsUniqueId,
    required this.title,
  });

  @override
  State<CustomExpandedDropdown> createState() => _CustomExpandedDropdownState();
}

class _CustomExpandedDropdownState extends State<CustomExpandedDropdown> {
  @override
  Widget build(BuildContext context) {
    // final deviceHeight= MediaQuery.of(context).size.height;
    // final deviceWidth= MediaQuery.of(context).size.width;

    final dropdownController = Get.put(ExpandedDropdownController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            widget.controller.toggleDropdown();
          },
          child: Obx(() => Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F5B6C),
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(
                  //   color: widget.controller.isOpen.value
                  //       ? Color(0xFFB8FE22)
                  //       : Colors.transparent,
                  //   width: 2,
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.controller.RoleSelected.value.isEmpty
                          ? widget.hintText
                          : widget.controller.RoleSelected.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      widget.controller.isOpen.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              )),
        ),
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: widget.controller.isOpen.value
                  ? widget.listOfItems.length * 53
                  : 0,
              child: widget.controller.isOpen.value
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: widget.listOfItems.length,
                          itemBuilder: (context, index) {
                            final option = widget.listOfItems[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: InkWell(
                                onTap: () {
                                  dropdownController.selectOption(option);
                                },
                                child: Obx(() {
                                  final isSelected =
                                      dropdownController.isSelected(option);
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    width: widget.buttonWidth,
                                    height: widget.buttonHeight,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.transparent
                                          : const Color(0xFF2F5B6C),
                                      borderRadius: BorderRadius.circular(8),
                                      border: isSelected
                                          ? Border.all(
                                              color: const Color(0xFFB8FE22),
                                              width: 1.5)
                                          : Border.all(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        isSelected ? 2.5 : 4,
                                      ),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 100),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF2F5B6C),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          child: Text(
                                            option,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: isSelected
                                                  ? const Color(0xFFB8FE22)
                                                  : Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          }),
                    )
                  : const SizedBox(),
            )),
      ],
    );
  }
}

/*

              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: widget.buttonWidth ?? 160 / 360 * deviceWidth,
                height: widget.buttonHeight / 800 * deviceHeight,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
                  border: buttonBorder,
                ),
                child: Padding(
                  padding: EdgeInsets.all(padding: EdgeInsets.all(
              isOpen.value
                  ? 2.5 / 360 * deviceWidth
                  : 4 / 360 * deviceWidth,
            ),),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
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
                        options[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _languageButtonsController.isSelected(widget.uniqueButtonId)
                              ? const Color(0xFFB8FE22)
                              : Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      : Container(),
)*/
