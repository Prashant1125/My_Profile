import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ExpandedDropdownController extends GetxController {
  var isOpen = false.obs;

  void toggleDropdown() {
    isOpen.value = !isOpen.value;
  }

  void closeDropdown() {
    isOpen.value = false;
  }

  // Map to store selection state for each option
  RxMap<String, bool> buttonStates = <String, bool>{}.obs;

  var RoleSelected = "".obs;

  void selectOption(String option) {
    // Reset all button states to false
    buttonStates.updateAll((key, value) => false);

    // Mark the selected option as true
    buttonStates[option] = true;

    RoleSelected.value = option;
    print(RoleSelected);
    // print(buttonStates);
  }

  bool isSelected(String option) {
    return buttonStates[option] ?? false;
  }
}
