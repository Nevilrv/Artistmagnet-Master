import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';

class AccountSettingController extends GetxController {
  //TODO: Implement AccountSettingController

  final count = 0.obs;

  ///date picker

  TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primaryColor: AppColors.redColor, // Header background color
            hintColor: AppColors.redColor, // Selection highlight color
            colorScheme: ColorScheme.light(
              primary: AppColors.redColor, // Selected date & buttons color
              onPrimary: AppColors.whiteColor, // Text color on selected date
              onSurface: AppColors.blackColor, // Default text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.redColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateController.text =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }

  ///gender select

  String selectedGender = "Male"; // Default selection

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
