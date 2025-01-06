import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/utils/color_constants.dart';
import 'package:my_profile/utils/image_constants.dart';
import 'package:my_profile/utils/string_constant.dart';

class VerificationController extends GetxController {
  Color getColor(int status) {
    switch (status) {
      case 0:
        return ColorConstant.sparentOverlay.withOpacity(.7);
      case 1:
        return ColorConstant.primaryGreen.withOpacity(.3);
      default:
        return ColorConstant.sparentOverlay.withOpacity(.7);
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
