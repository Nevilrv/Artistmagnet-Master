import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/comman_textfield.dart';
import '../../../core/values/app_color.dart';
import '../../../core/values/app_string.dart';
import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  const AccountSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentColor,
          title: Text(AppString.accountSetting),
          titleTextStyle: AppTextStyle.regularBlack14,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (h * 0.02).h,
                Text(
                  AppString.accountSetting,
                  style: AppTextStyle.boldRed16,
                ),
                (h * 0.02).h,
                Row(
                  children: [
                    Text(
                      AppString.clickHereToBecomeAPowerMagnet,
                      style: AppTextStyle.semiboldBlack12,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.030, vertical: h * 0.010),
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(6),
                          // gradient: LinearGradient(
                          //     colors: [
                          //       AppColors.whiteColor,
                          //       AppColors.redColor2,
                          //       AppColors.redColor2,
                          //     ],
                          //     begin: Alignment.topCenter,
                          //     end: Alignment.bottomCenter),
                        ),
                        child: Text(
                          AppString.continueTxt,
                          style: AppTextStyle.regularBlack14.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
                (h * 0.02).h,
                Text.rich(
                  TextSpan(
                    text: AppString.firstName,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                CommonTextField(),
                (h * 0.02).h,
                Text.rich(
                  TextSpan(
                    text: AppString.lastName,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                CommonTextField(),
                (h * 0.02).h,
                Text.rich(
                  TextSpan(
                    text: AppString.dateOfBirth,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  height: h * 0.050,
                  child: TextFormField(
                    controller: controller.dateController, // Controller to hold selected date
                    style: AppTextStyle.regularBlack12,
                    cursorColor: AppColors.blackColor,
                    cursorWidth: 1,
                    readOnly: true, // Prevent keyboard from opening
                    onTap: () => controller.selectDate(context),
                    decoration: InputDecoration(
                      hintText: "Select Date",
                      suffixIcon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor), // Calendar icon
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(0)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(0)),
                    ),
                  ),
                ),
                (h * 0.02).h,
                Text.rich(
                  TextSpan(
                    text: AppString.gender,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                  height: h * 0.050,
                  padding: EdgeInsets.symmetric(horizontal: 10), // Padding for better UI
                  child: DropdownButtonFormField<String>(
                    value: controller.selectedGender, // Holds the selected value
                    decoration: InputDecoration(
                      border: InputBorder.none, // Removes default underline
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    style: AppTextStyle.regularBlack12,
                    dropdownColor: AppColors.whiteColor, // Dropdown background color
                    icon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.blackColor), // Dropdown icon
                    items: ["Male", "Female", "Other"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: AppTextStyle.regularBlack12,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.selectedGender = newValue; // Update selected value
                      }
                    },
                  ),
                ),
                (h * 0.02).h,
                Text(
                  AppString.youAreAskedToEnterYourDateOfBirthTxt,
                  style: AppTextStyle.regularBlack12,
                ),
                (h * 0.01).h,
                Text.rich(
                  TextSpan(
                    text: AppString.email,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                CommonTextField(),
                (h * 0.02).h,
                Text.rich(
                  TextSpan(
                    text: AppString.confirmEmail,
                    style: AppTextStyle.regularBlack12,
                    children: <InlineSpan>[
                      TextSpan(
                        text: "*",
                        style: AppTextStyle.boldRed12,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                (h * 0.006).h,
                CommonTextField(),
                (h * 0.02).h,
                Text(
                  AppString.passwordTxt,
                  style: AppTextStyle.regularBlack12,
                ),
                (h * 0.01).h,
                CommonTextField(),
                (h * 0.02).h,
                Text(
                  AppString.passwordConfirmation,
                  style: AppTextStyle.regularBlack12,
                ),
                (h * 0.01).h,
                CommonTextField(),
                (h * 0.02).h,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.020, vertical: h * 0.010),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor2.withValues(alpha: 0.70),
                          offset: Offset(3, 3), // Shadow only at the bottom
                          spreadRadius: 0,
                          blurRadius: 0, // Adjust for a softer shadow
                        ),
                      ],
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(6),
                      // gradient: LinearGradient(
                      //     colors: [
                      //       AppColors.whiteColor,
                      //       AppColors.redColor2,
                      //       AppColors.redColor2,
                      //     ],
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter),
                    ),
                    child: Text(
                      AppString.updateAccountSetting,
                      style: AppTextStyle.regularBlack14.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ),
                (h * 0.02).h,
                GestureDetector(
                  onTap: () {},
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
                      padding: EdgeInsets.symmetric(horizontal: w * 0.015, vertical: h * 0.005),
                      child: Text(
                        AppString.deleteMyAccount,
                        style: AppTextStyle.regularBlack12,
                      ),
                    ),
                  ),
                ),
                (h * 0.02).h,
              ],
            ),
          ),
        ));
  }
}
