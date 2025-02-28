import 'package:artistmagnet/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToNextScreen();
    super.onInit();
  }

  navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.ONBORDING);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
