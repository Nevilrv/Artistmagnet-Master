import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
// Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var obSecure = true.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var selectedGender;
  var selectedDay;
  var selectedMonth;
  var selectedYear;
  var agreeToTerms = false.obs;

  // Gender List
  List<String> genderList = ["Male", "Female", "Other"];

  // Day, Month, Year Lists
  List<String> days = List.generate(31, (index) => (index + 1).toString());
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<String> years = List.generate(100, (index) => (2024 - index).toString());

  setLoading(bool value) {
    isLoading.value = value;
    update();
  }

  showAndHideObSecureText() {
    obSecure.value = !obSecure.value;
    update();
  }

  final count = 0.obs;
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
