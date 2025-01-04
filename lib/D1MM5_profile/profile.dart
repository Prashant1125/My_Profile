import 'package:flutter/material.dart';
import 'package:my_profile/components/profile_overview_tab.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: Column(
        children: [
          ProfileOverviewTab(),
        ],
      ),
    );
  }
}
