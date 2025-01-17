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



























  // RxBool focusNodeEnabled = false.obs;
  //
  //  Map<int, FocusNode> focusNodesMap = {};
  //  var focusedIndex = -1.obs;
  //
  //
  // int addNewFocusNode(){
  //   int newIndex = focusNodesMap.length;
  //
  //   FocusNode newFocusNode = FocusNode();
  //   newFocusNode.addListener((){
  //     focusedIndex = newFocusNode.hasFocus ? newIndex : -1 ;
  //   });
  //
  //   focusNodesMap[newIndex] = newFocusNode;
  //   return newIndex;
  // }
  //
  // FocusNode? returnFocusNodeForSpecificIndex(int index){
  //   return focusNodesMap[index];
  // }
  //
  //
  //
  // //A map of focus nodes with keys as index and values as focus Nodes.
  // //Whenever a new TextField is created, addFocusNode is called and a newFocusNode is created
