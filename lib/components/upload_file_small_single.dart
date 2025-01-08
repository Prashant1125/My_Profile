import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile/utils/image_constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../controllers/image_picker.dart';
import '../utils/color_constants.dart';

class UploadFileSmallSingle extends StatelessWidget {
  const UploadFileSmallSingle({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    return SizedBox(
      height: 250,
      width: 500,
      child: DottedBorder(
        borderPadding: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(35),
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 10],
        color: ColorConstant.darkBlue,
        strokeWidth: 2,
        child: Obx(() {
          return imagePickerController.pickedImage.value == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 220,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          imagePickerController.pickImage(ImageSource.camera);
                        },
                        icon: const Image(
                            image: AssetImage(ImageConstants.camera)),
                        label: const Text(
                          "Open Camera",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text("Or",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.pureWhite,
                        )),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          "Choose from",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: ColorConstant.pureWhite,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            imagePickerController
                                .pickImage(ImageSource.gallery);
                          },
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: ColorConstant.primaryGreen,
                              decorationThickness: 2,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: ColorConstant.primaryGreen,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Positioned(
                      right: 10,
                      top: 8,
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: ColorConstant.pureWhite)),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              const Image(
                                  image:
                                      AssetImage(ImageConstants.fileUploading)),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Text(
                                    'imagePickerController.imageName.value',
                                    // imagePickerController.imageName.value,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: "Poppins",
                                        color: ColorConstant.pureWhite),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage(ImageConstants.timer)),
                              Text(
                                'Time Left :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.primaryGreen,
                                    fontWeight: FontWeight.w700),
                              ),
                              // update the string when implementing uploading a file to api by imagePickerController.timeleft.value
                              Text(
                                '3 Min',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.pureWhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Image(
                                  image: AssetImage(ImageConstants.fileSize)),
                              Text(
                                'Size :',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.primaryGreen,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                imagePickerController.imageSize.value,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.pureWhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LinearPercentIndicator(
                                width: 200.0,
                                lineHeight: 5.0,
                                percent:
                                    0.20, //update the Value when implementing uploading a file to api by imagePickerController.uploading.value
                                backgroundColor: Colors.grey,
                                progressColor: Colors.blue,
                                barRadius: const Radius.circular(10),
                              ),
                              Text(
                                '20%',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ColorConstant.primaryGreen,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
