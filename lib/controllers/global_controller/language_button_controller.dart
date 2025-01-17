// ignore_for_file: avoid_print

import 'package:get/get.dart';

class LanguageButtonsController extends GetxController {
  RxMap<String, bool> buttonsStates = <String, bool>{
    'Fat Loss': false,
    'Endurance Improvement': false,
    'Flexibility & Mobility': false,
    'Muscle Gain': false,
    'Strength Building': false,
    'Muscle Toning': false,
    'General Fitness & Wellness': false,
    'Sports-Specific Training': false,
    'Rehabilitation & Recovery': false,
    'Weight Gain': false,
    'English': false,
    'Hindi': false,
    'Bengali': false,
    'Marathi': false,
    'Tamil': false,
    'Malayali': false,
    'Gujarati': false,
    'Urdu': false,
    'Kannnada': false,
    'Odia': false,
    'Punjabi': false,
    'Assam': false
  }.obs;

//every time a new button is added, add its map entry here in this map

  void changeStateGeneric(String uniqueButtonId) {
    buttonsStates[uniqueButtonId] = !(buttonsStates[uniqueButtonId] ?? false);
  }

  void changeState_for_MembershipObjectives(
      String uniqueButtonId, int membershipObjectiveListIndex) {
    print(buttonsStates);
    if (buttonsStates[uniqueButtonId] == true) {
      buttonsStates[uniqueButtonId] = false;
      listOfIndexesSelected.remove(membershipObjectiveListIndex);
    } else if (buttonsStates[uniqueButtonId] == false) {
      buttonsStates[uniqueButtonId] = true;
      listOfIndexesSelected.add(membershipObjectiveListIndex);
    }

    print(listOfIndexesSelected.toString());
  }
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% D 1 M M 2 - LANGUAGE SELECT BUTTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  RxList<String> languagesSelected = <String>[].obs;

  void changeState_for_LanguageSelected(
      String uniqueButtonId, int languageListIndex) {
    print(buttonsStates);

    if (buttonsStates[uniqueButtonId] == true) {
      buttonsStates[uniqueButtonId] = false;
      listOflanguageIndexesSelected.remove(languageListIndex);
      languagesSelected.remove(uniqueButtonId);
    } else if (buttonsStates[uniqueButtonId] == false) {
      buttonsStates[uniqueButtonId] = true;
      listOflanguageIndexesSelected.add(languageListIndex);
      languagesSelected.add(uniqueButtonId);
    }

    print(listOflanguageIndexesSelected.toString());
    print(languagesSelected);
  }

  List<String> listOfLanguages = [
    'English',
    'Hindi',
    'Bengali',
    'Marathi',
    'Tamil',
    'Malayali',
    'Gujarati',
    'Urdu',
    'Kannnada',
    'Odia',
    'Punjabi',
    'Assam'
  ];

  List<String> listOfLanguagesUniqueId = [
    'English',
    'Hindi',
    'Bengali',
    'Marathi',
    'Tamil',
    'Malayali',
    'Gujarati',
    'Urdu',
    'Kannnada',
    'Odia',
    'Punjabi',
    'Assam'
  ];

  RxList<int> listOflanguageIndexesSelected = <int>[].obs;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  bool isSelected(String id) {
    return buttonsStates[id] ?? false;
  }

  //Membership objective buttons are also using the language button global component

  List<String> listOfObjectives = [
    'Fat Loss',
    'Endurance Improvement',
    'Flexibility & Mobility',
    'Muscle Gain',
    'Strength Building',
    'Muscle Toning',
    'General Fitness & Wellness',
    'Sports-Specific Training',
    'Rehabilitation & Recovery',
    'Weight Gain'
  ];

  List<String> listOfObjectivesButtonUniqueId = [
    'Fat Loss',
    'Endurance Improvement',
    'Flexibility & Mobility',
    'Muscle Gain',
    'Strength Building',
    'Muscle Toning',
    'General Fitness & Wellness',
    'Sports-Specific Training',
    'Rehabilitation & Recovery',
    'Weight Gain'
  ];

  RxList<int> listOfIndexesSelected = <int>[].obs;
}
