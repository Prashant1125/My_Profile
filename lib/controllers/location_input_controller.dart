import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationInputController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();

  Future<String> pickLocation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return "Selected Location (Latitude, Longitude)";
  }
}
