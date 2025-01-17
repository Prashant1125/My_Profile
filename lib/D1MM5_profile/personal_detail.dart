import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/components/Global%20Components/pin_input.dart';
import 'package:my_profile/components/Global%20Components/text_input_field.dart';
import 'package:my_profile/components/character_input_field/label.dart';
import 'package:my_profile/utils/color_constants.dart';
import '../components/D1MM5_MYPROFILE/contact_input.dart';
import '../components/D1MM5_MYPROFILE/ctx_field.dart';
import '../components/D1MM5_MYPROFILE/custom_elevated_button.dart';
import '../components/D1MM5_MYPROFILE/date_input.dart';
import '../components/Global Components/custum_expanded.dart';
import '../components/Global Components/language_button.dart';
import '../components/Global Components/location_input.dart';
import '../components/Global Components/redio_button.dart';
import '../components/upload_file_small_single.dart';
import '../controllers/global_controller/cutum_dropdown_controller.dart';
import '../controllers/global_controller/language_button_controller.dart';
import '../controllers/global_controller/single_select_radio_controller.dart';
import '../utils/image_constants.dart';

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController address2Controller = TextEditingController();

    bool isPphoneError = false;
    final MembershipTypeRadioController genderController =
        Get.put(MembershipTypeRadioController());
    final ExpandedDropdownController dropdownController =
        Get.put(ExpandedDropdownController());
    final LanguageButtonsController languageButtonsController =
        Get.put(LanguageButtonsController());
    List<String> listOfRoles = [
      'Owner',
      'Manager',
      'Owner/Manager',
      'Trainer',
      'System Admin',
    ];

    List<String> listOfRolesUniqueId = [
      'Owner',
      'Manager',
      'Owner/Manager',
      'Trainer',
      'System Admin',
    ];

    return Scaffold(
      backgroundColor: ColorConstant.darkGrey.withAlpha((0.5 * 255).round()),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.yoga),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color:
                        ColorConstant.primaryBlue.withAlpha((.5 * 255).round()),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Personal Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Barlow Semi Condensed',
                              height: 0,
                            ),
                          ),
                          Divider(
                            color: ColorConstant.primaryBlue
                                .withAlpha((.5 * 255).round()),
                            thickness: 3,
                            height: 15,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            hintText: '(Auto filled from social Media)',
                            controller: nameController,
                            title: 'Full Name',
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 10),
                          ContactInputField(
                            title: 'Phone Number',
                            enabled: true,
                            hintText: '+91 - XXXXXXXXXX',
                            isEmpty: isPphoneError,
                            textEditingController: phoneController,
                            uniqueTextInputFieldId: 'Manager_Contact',
                          ),
                          const SizedBox(height: 10),
                          RadioButtonTab(
                            title: 'Selected Gender',
                            buttonCount: 3,
                            buttonTexts: const ["Male", "Female", "Other"],
                            buttonWidth: screenWidth * (102 / 360),
                            controller: genderController,
                          ),
                          const SizedBox(height: 10.0),
                          const UploadFileSmallSingle(),
                          const SizedBox(height: 10),
                          DateInputField(
                              title: 'Date Of Birth',
                              hintText: 'DD-MM-YYYY',
                              isEmpty: false.obs,
                              enabled: true,
                              uniqueTextInputFieldId: 'Date',
                              width: screenHeight * 0.975),
                          const SizedBox(height: 10.0),
                          CustomExpandedDropdown(
                            title: 'What defines you best?',
                            controller: dropdownController,
                            buttonWidth: 20,
                            buttonHeight: 45,
                            listOfItems: listOfRoles,
                            listOfItemsUniqueId: listOfRolesUniqueId,
                          ),
                          const SizedBox(height: 10.0),
                          LocationInputField(
                            title: 'Address Line 1 (or PIN on map)',
                            hintText: 'Address',
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextInputField(
                                enabled: true,
                                textEditingController: cityController,
                                hintText: "Enter City",
                                uniqueTextInputFieldId: 'City',
                                width: screenWidth * (324 / 360) * (0.5) - 5,
                                title: 'City',
                              ),
                              TextInputField(
                                enabled: true,
                                textEditingController: stateController,
                                hintText: "Enter State",
                                uniqueTextInputFieldId: 'State',
                                width: screenWidth * (324 / 360) * (0.5) - 5,
                                title: 'State',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextInputField(
                                enabled: true,
                                textEditingController: countryController,
                                hintText: "Enter Country",
                                uniqueTextInputFieldId: 'Country',
                                width: screenWidth * (324 / 360) * (0.5) - 5,
                                title: 'Country',
                              ),
                              PinInputField(
                                hintText: "_ _ _ _ _ _",
                                uniqueTextInputFieldId: 'Pin',
                                width: screenWidth * (324 / 360) * (0.5) - 5,
                                enabled: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          TextInputField(
                            enabled: true,
                            textEditingController: address2Controller,
                            hintText: "Enter your colony of locality",
                            uniqueTextInputFieldId: 'AddressLine2',
                            width: screenHeight * 0.975,
                            title: 'Address Line 2',
                            title2: '(optional)',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Label(
                              fieldTitle: 'Preferred Language',
                              title2: '(optional)'),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: screenHeight * (190 / 800),
                              width: screenWidth,
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 96.67 / 35,
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4),
                                itemCount: 12,
                                itemBuilder: (context, index) {
                                  return LanguageButton(
                                      onTap: () {
                                        languageButtonsController
                                            .changeState_for_LanguageSelected(
                                                languageButtonsController
                                                        .listOfLanguagesUniqueId[
                                                    index],
                                                index);
                                      },
                                      buttonWidth: screenWidth * 0.29,
                                      buttonHeight: 45,
                                      buttonText: languageButtonsController
                                          .listOfLanguagesUniqueId[index],
                                      uniqueButtonId: languageButtonsController
                                          .listOfLanguagesUniqueId[index]);
                                },
                              )),
                          const SizedBox(height: 10.0),
                          ListTile(
                              titleAlignment: ListTileTitleAlignment.top,
                              leading: Icon(
                                Icons.info_outline,
                                color: ColorConstant.pureWhite,
                              ),
                              title: Text(
                                "By clicking the Update button, you'll agree to the T&C.",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorConstant.pureWhite),
                              )),
                          const SizedBox(height: 10.0),
                          CustomElevatedButton(
                              text: 'Update',
                              height: screenWidth * (45 / 360),
                              width: screenWidth * (324 / 360),
                              onTap: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
