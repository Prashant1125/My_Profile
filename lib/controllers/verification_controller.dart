import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/utils/color_constants.dart';
import 'package:my_profile/utils/image_constants.dart';
import 'package:my_profile/utils/string_constant.dart';

class VerificationController extends GetxController {
  Color getColor(int status) {
    switch (status) {
      case 0:
        return ColorConstant.sparentOverlay.withAlpha((0.7 * 255).round());
      case 1:
        return ColorConstant.primaryGreen.withAlpha((0.3 * 255).round());
      default:
        return ColorConstant.sparentOverlay.withAlpha((0.7 * 255).round());
    }
  }

  String getIcon(int status) {
    switch (status) {
      case 0:
        return ImageConstants.unVerifiedStatusIcon;
      case 1:
        return ImageConstants.verifiedStatusIcon;
      default:
        return ImageConstants.unVerifiedStatusIcon;
    }
  }

  String getStatus(int status) {
    switch (status) {
      case 0:
        return StringConstant.unVerified;
      case 1:
        return StringConstant.verified;
      default:
        return StringConstant.unVerified;
    }
  }
}
