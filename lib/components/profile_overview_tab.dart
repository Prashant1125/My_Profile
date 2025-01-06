import 'package:flutter/material.dart';
import 'package:my_profile/components/profile_icon.dart';
import 'package:my_profile/components/verification_status.dart';
import 'package:my_profile/utils/color_constants.dart';

import 'D1MM5_MYPROFILE/custom_list.dart';

class ProfileOverviewTab extends StatelessWidget {
  const ProfileOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Card(
        elevation: 30,
        color: ColorConstant.primaryBlue.withOpacity(.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomListtile(
            leading: const ProfileIcon(),
            title: Text(
              'Manager Name',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  color: ColorConstant.pureWhite),
            ),
            subtitle: Text(
              'Manager/Owner',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.primaryGreen),
            ),
            trailing: const VerificationStatus(
              status: 0,
            ),
          ),
        ),
      ),
    );
  }
}
