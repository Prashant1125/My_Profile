import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'D1MM5_profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile App',
      home: MyProfile(),
    );
  }
}
