import 'dart:io';

import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BuildAResumeController extends GetxController {
  //TODO: Implement BuildAResumeController

  final count = 0.obs;

  ///radio

  var selectedRadio = 1.obs;

  ///multiple image pick add

  var images = <Map<String, dynamic>>[].obs;

  final ImagePicker picker = ImagePicker();
  int imageCount = 1;

  void addImage() {
    imageCount++;
    images.add({"image": "", "default": AppAssets.gallery});
  }

  void removeImage(int index) {
    if (images.length > 0) {
      images.removeAt(index);
    }
  }

  Future<void> pickImage(int index) async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images[index]["image"] = pickedFile.path;
      images.refresh();
    }
  }

  ///single image pick
  Rx<File?> image = Rx<File?>(null);
  Rx<File?> image1 = Rx<File?>(null);
  Future<void> pickImage1() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickImage2() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image1.value = File(pickedFile.path);
    }
  }

  void removeImage1() {
    image.value = null; // Set to null, so UI hides
  }

  void removeImage2() {
    image1.value = null; // Set to null, so UI hides
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
