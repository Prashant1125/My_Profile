import 'package:get/get.dart';

class TextInputFieldController extends GetxController {
  final RxString _currentFocusedFieldId = ''.obs;

  void requestFocus(String uniqueTextInputFieldId) {
    if (_currentFocusedFieldId.value != uniqueTextInputFieldId) {
      _currentFocusedFieldId.value = uniqueTextInputFieldId;
      //print(_currentFocusedFieldId.value);
    }
  }

  void removeFocus() {
    _currentFocusedFieldId.value = '';
  }

  bool isFieldFocused(String uniqueTextInputFieldId) {
    if (_currentFocusedFieldId.value == uniqueTextInputFieldId) {
      return true;
    } else {
      return false;
    }
  }
}
