import 'package:flutter/material.dart';
import 'package:my_profile/components/header_manager/custom_app_bar.dart';
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
      backgroundColor: ColorConstant.darkGrey.withAlpha((0.5 * 255).round()),
      appBar: const CustomAppBar(),
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'My Profile ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Barlow Semi Condensed',
                    height: 0,
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Manage your account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' as your wish.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SettingsContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
