import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateInputController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final RxString _currentFocusedFieldId = ''.obs;
  RxBool isValidDOB = true.obs; // Tracks whether the DOB is valid

  /// Formats the input date string with `dd-MM-yyyy` pattern
  String formatDate(String value) {
    String digitsOnly = value.replaceAll('-', '');
    final cursorPosition = textEditingController.selection.baseOffset;

    if (digitsOnly.length <= 2) {
      textEditingController.text = digitsOnly;
    } else if (digitsOnly.length <= 4) {
      textEditingController.text =
          '${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2)}';
    } else {
      textEditingController.text =
          '${digitsOnly.substring(0, 2)}-${digitsOnly.substring(2, 4)}-${digitsOnly.substring(4, 8)}';
    }

    textEditingController.selection = TextSelection.collapsed(
      offset: cursorPosition.clamp(0, textEditingController.text.length),
    );

    // Validate DOB for manual input
    try {
      DateTime enteredDate =
          DateFormat('dd-MM-yyyy').parse(textEditingController.text);
      validateDOB(enteredDate);
    } catch (e) {
      isValidDOB.value = false; // Set as invalid if parsing fails
    }

    return textEditingController.text;
  }

  /// Opens a date picker dialog and sets the formatted date
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFF063434),
            cardColor: const Color(0xFFB8FE22),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFB8FE22),
            ),
            dialogBackgroundColor: const Color(0xFFE0F7FA),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (picked != null) {
      textEditingController.text =
          '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
      validateDOB(picked);
    }
  }

  /// Validates the date of birth to check if the user is 18+ years old
  void validateDOB(DateTime dateOfBirth) {
    DateTime today = DateTime.now();
    int age = today.year - dateOfBirth.year;

    // Adjust age if the current date is before the birth date this year
    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }

    isValidDOB.value = age >= 18; // Set validity based on age
  }

  /// Requests focus for a specific field
  void requestFocus(String uniqueTextInputFieldId) {
    _currentFocusedFieldId.value = uniqueTextInputFieldId;
  }

  /// Removes focus from the current field
  void removeFocus() {
    _currentFocusedFieldId.value = '';
  }

  /// Checks if a specific field is focused
  bool isFieldFocused(String uniqueTextInputFieldId) {
    return _currentFocusedFieldId.value == uniqueTextInputFieldId;
  }
}
