import 'package:flutter/material.dart';
import 'package:my_profile/components/custom_listtile.dart';
import 'package:my_profile/components/profile_icon.dart';
import 'package:my_profile/components/verification_status.dart';

class ProfileOverviewTab extends StatelessWidget {
  const ProfileOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Card(
        elevation: 30,
        color: const Color(0xFF55A6C4).withOpacity(0.5),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomListtile(
            leading: ProfileIcon(),
            title: Text(
              'Manager Name',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  color: Colors.white),
            ),
            subtitle: Text(
              'Manager/Owner',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB8FE22)),
            ),
            trailing: VerificationStatus(
              status: 0,
            ),
          ),
        ),
      ),
    );
  }
}
