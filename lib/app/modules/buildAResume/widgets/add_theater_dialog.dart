import 'dart:developer';

import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/buildAResume/controllers/build_a_resume_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';

class AddTheaterDialog extends StatelessWidget {
  AddTheaterDialog({super.key});

  BuildAResumeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Obx(
          () => Container(
            height: 350,
            width: w,
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppString.addCredit,
                      style: AppTextStyle.boldBlack16.copyWith(fontSize: 20),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text.rich(
                        TextSpan(
                          text: AppString.role,
                          style: AppTextStyle.regularBlack16,
                          children: [
                            TextSpan(
                              text: "*",
                              style: AppTextStyle.boldRed14,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: " : ",
                              style: AppTextStyle.regularBlack16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.0.w,
                    Expanded(
                      flex: 5,
                      child: CommonTextField(
                        controller: controller.roleController,
                        hintText: "Enter Role",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text.rich(
                        TextSpan(
                          text: "Production",
                          style: AppTextStyle.regularBlack16,
                          children: [
                            TextSpan(
                              text: "*",
                              style: AppTextStyle.boldRed14,
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: " : ",
                              style: AppTextStyle.regularBlack16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.0.w,
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: h * 0.05,
                        width: w,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            items: List.generate(2, (index) {
                              return DropdownMenuItem(
                                value: "Production $index",
                                child: Text("Production $index"),
                              );
                            }),
                            onChanged: (value) {
                              if (value != null) {
                                controller.updateSelectedProduction(value);
                              }
                            },
                            hint: Text(
                              controller.selectedProduction.value.isEmpty ? "Select Production" : controller.selectedProduction.value,
                              style: AppTextStyle.regularBlack12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text.rich(
                        TextSpan(
                          text: "Director:",
                          style: AppTextStyle.regularBlack16,
                          children: [],
                        ),
                      ),
                    ),
                    10.0.w,
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: h * 0.05,
                        width: w,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            items: List.generate(2, (index) {
                              return DropdownMenuItem(
                                value: "Director $index",
                                child: Text("Director $index"),
                              );
                            }),
                            onChanged: (value) {
                              if (value != null) {
                                controller.updateSelectedDirector(value);
                              }
                            },
                            hint: Text(
                              controller.selectedDirector.value.isEmpty ? "Select Director" : controller.selectedDirector.value,
                              style: AppTextStyle.regularBlack12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.0.h,
                Center(
                  child: GestureDetector(
                    onTap: () {
                      log('controller.roleController.text.isEmpty::::::::::::::::${controller.roleController.text.isEmpty}');
                      log('controller.selectedProduction.value.isEmpty::::::::::::::::${controller.selectedProduction.value.isEmpty}');
                      log(' controller.selectedDirector.value.isEmpty::::::::::::::::${ controller.selectedDirector.value.isEmpty}');
                      log('controller.roleController.text.isEmpty ||:::::::::::::::${controller.roleController.text.isEmpty || controller.selectedProduction.value.isEmpty || controller.selectedDirector.value.isEmpty}');
                      if (controller.roleController.text.isEmpty ||
                          controller.selectedProduction.value.isEmpty ||
                          controller.selectedDirector.value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter all details")));
                      } else {
                        controller.addTheater(TheaterModel(
                            director: controller.selectedDirector.value,
                            production: controller.selectedProduction.value,
                            role: controller.roleController.text));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyColor.withValues(alpha: 0.40),
                            offset: Offset(3, 3), // Shadow only at the bottom
                            spreadRadius: 0,
                            blurRadius: 0, // Adjust for a softer shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.01),
                        child: Text(
                          "Done",
                          style: AppTextStyle.regularBlack12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
