import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isRememberMe = false.obs;
  var isPolicyAccept = false.obs;
  var obSecure = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  setLoading(value) {
    isLoading.value = value;
    update();
  }

  setRememberMe(bool value) {
    isRememberMe.value = value;
    update();
  }

  setPolicyAccept(bool value) {
    isPolicyAccept.value = value;
    update();
  }

  showAndHideObSecureText() {
    obSecure.value = !obSecure.value;
    update();
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
}
