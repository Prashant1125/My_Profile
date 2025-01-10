import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/components/profile_icon.dart';
import 'package:my_profile/components/verification_status.dart';
import 'package:my_profile/utils/color_constants.dart';
import 'D1MM5_MYPROFILE/custom_list.dart';

class ProfileOverviewTab extends StatelessWidget {
  const ProfileOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .1,
      child: Card(
        elevation: 30,
        color: ColorConstant.primaryBlue.withAlpha((0.5 * 255).round()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomListtile(
            leading: const ProfileIcon(),
            title: Text(
              'Manager Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  color: ColorConstant.pureWhite),
            ),
            subtitle: Text('Manager/Owner',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.primaryGreen)),
            trailing: const VerificationStatus(
              status: 0,
            ),
          ),
        ),
      ),
    );
  }
}
