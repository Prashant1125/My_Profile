import 'package:flutter/material.dart';
import 'package:my_profile/utils/color_constants.dart';

import '../components/upload_file_small_single.dart';
import '../utils/image_constants.dart';

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.pureBlack.withAlpha((0.5 * 255).round()),
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.yoga),
                  fit: BoxFit.cover,
                  opacity: .2)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadFileSmallSingle(),
            ],
          ),
        ),
      ),
    );
  }
}
