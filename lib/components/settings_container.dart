import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/D1MM5_profile/personal_detail.dart';
import 'package:my_profile/components/D1MM5_MYPROFILE/element.dart';
import 'package:my_profile/utils/image_constants.dart';
import '../utils/color_constants.dart';
import 'character_input_field/section_break.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      color: ColorConstant.primaryBlue.withAlpha((0.5 * 255).round()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionBreak(
            sectionTitle: 'Personal & Business',
            sectionDescription: Column(
              children: [
                ElementTile(
                  leadingIcon: ImageConstants.user,
                  text: 'Personal Details',
                  color:
                      ColorConstant.primaryBlue.withAlpha((0.3 * 255).round()),
                  onTap: () => Get.to(const PersonalDetail()),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.profession,
                  text: 'My Business & Webpage',
                  color:
                      ColorConstant.primaryGreen.withAlpha((0.3 * 255).round()),
                ),
              ],
            ),
          ),
          SectionBreak(
            sectionTitle: 'Memberships',
            sectionDescription: Column(
              children: [
                ElementTile(
                  leadingIcon: ImageConstants.crown,
                  text: 'My Subscription & Plans',
                  color: ColorConstant.chineBlack
                    ..withAlpha((0.25 * 255).round()),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.userCheak,
                  text: 'My Trainer',
                  color: ColorConstant.sparentOverlay
                      .withAlpha((0.70 * 255).round()),
                ),
              ],
            ),
          ),
          SectionBreak(
            sectionTitle: 'Financials',
            sectionDescription: Column(
              children: [
                ElementTile(
                  leadingIcon: ImageConstants.money,
                  text: 'Bank Accounts',
                  color: ColorConstant.offWhite.withAlpha((0.3 * 255).round()),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.exchange,
                  text: 'Transactions',
                  color:
                      ColorConstant.primaryBlue.withAlpha((0.3 * 255).round()),
                ),
              ],
            ),
          ),
          SectionBreak(
            sectionTitle: 'General Settings',
            sectionDescription: Column(
              children: [
                ElementTile(
                  leadingIcon: ImageConstants.settings,
                  text: 'My Account',
                  color:
                      ColorConstant.primaryBlue.withAlpha((0.5 * 255).round()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
