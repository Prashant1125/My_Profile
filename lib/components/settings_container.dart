import 'package:flutter/material.dart';
import 'package:my_profile/components/D1MM5_MYPROFILE/element.dart';
import 'package:my_profile/utils/image_constants.dart';

import '../utils/color_constants.dart';
import 'D1MM5_MYPROFILE/section_break.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      color: ColorConstant.primaryBlue.withOpacity(.5),
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
                  color: ColorConstant.primaryBlue.withOpacity(.3),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.profession,
                  text: 'My Business & Webpage',
                  color: ColorConstant.primaryGreen.withOpacity(.3),
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
                  color: ColorConstant.chineBlack.withOpacity(.25),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.userCheak,
                  text: 'My Trainer',
                  color: ColorConstant.sparentOverlay.withOpacity(.70),
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
                  color: ColorConstant.offWhite.withOpacity(.3),
                ),
                ElementTile(
                  leadingIcon: ImageConstants.exchange,
                  text: 'Transactions',
                  color: ColorConstant.primaryBlue.withOpacity(.3),
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
                  color: ColorConstant.primaryBlue.withOpacity(.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
