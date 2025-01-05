import 'package:flutter/material.dart';
import 'package:my_profile/components/custom_listtile.dart';
import 'package:my_profile/components/profile_icon.dart';
import 'package:my_profile/components/verification_status.dart';
import 'package:my_profile/utils/color_constants.dart';

class ProfileOverviewTab extends StatelessWidget {
  const ProfileOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Card(
        elevation: 30,
        color: ColorConstant.cardColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomListtile(
            leading: ProfileIcon(),
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
                  color: ColorConstant.prinmaryGreen),
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
