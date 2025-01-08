import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var pickedImage = Rx<File?>(null);
  var imageName = ''.obs;
  var imageSize = ''.obs;
  var uploading = false.obs;
  var timeLeft = ''.obs;
  var uploadProgress = 0.0.obs;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      File? file = File(image.path);
      pickedImage.value = file;
      imageName.value = file.path.split('/').last; // Extract the file name
      imageSize.value = _getFileSize(file);
    }
  }

  String _getFileSize(File file) {
    final bytes = file.lengthSync();
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1048576) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else {
      return '${(bytes / 1048576).toStringAsFixed(2)} MB';
    }
  }

  void cancelSelectedImage() {
    pickedImage.value = null;
    imageName.value = '';
    imageSize.value = '';
    uploading.value = false;
    timeLeft.value = '';
    uploadProgress.value = 0.0;
  }

  // Simulate image upload with progress
}
