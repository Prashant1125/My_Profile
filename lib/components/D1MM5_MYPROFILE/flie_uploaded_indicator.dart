import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/image_picker.dart';
import '../../utils/color_constants.dart';
import '../../utils/image_constants.dart';

class FlieUploadedIndicator extends StatelessWidget {
  const FlieUploadedIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    return SizedBox(
      width: Get.width * .35,
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 3,
            children: [
              const Image(
                  height: 20,
                  image: AssetImage(
                    ImageConstants.fileUploading,
                  )),
              Flexible(
                child: SizedBox(
                  width: 100,
                  child: Text(
                    imagePickerController.imageName.value,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                        color: ColorConstant.pureWhite),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                '+1', // implementing a functionallity of number of image
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    color: ColorConstant.pureWhite),
              ),
            ],
          ),
          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
                color: ColorConstant.pureWhite.withAlpha((.3 * 255).round()),
                borderRadius: BorderRadius.circular(10)),
            child: const Image(image: AssetImage(ImageConstants.fileUploading)),
          )
        ],
      ),
    );
  }
}
