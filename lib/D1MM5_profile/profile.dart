import 'package:flutter/material.dart';
import 'package:my_profile/components/profile_overview_tab.dart';
import 'package:my_profile/utils/color_constants.dart';
import 'package:my_profile/utils/image_constants.dart';
import '../components/settings_container.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.pureBlack.withAlpha((0.5 * 255).round()),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.yoga),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfileOverviewTab(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Divider(
                    thickness: 3,
                    color: ColorConstant.primaryBlue
                        .withAlpha((0.5 * 255).round()),
                  ),
                ),
                const SettingsContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
