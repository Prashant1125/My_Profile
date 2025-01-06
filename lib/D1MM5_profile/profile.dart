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
      backgroundColor: ColorConstant.appBar.withOpacity(.5),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.yoga),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: Column(
            children: [
              const ProfileOverviewTab(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Divider(
                  thickness: 1.5,
                  color: ColorConstant.primaryBlue.withOpacity(.5),
                ),
              ),
              const SettingsContainer()
            ],
          ),
        ),
      ),
    );
  }
}
