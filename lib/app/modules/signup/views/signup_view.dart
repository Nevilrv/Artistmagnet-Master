import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/common/common_button.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/signup/controllers/signup_controller.dart';
import 'package:artistmagnet/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> {
  SignupView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (h * 0.06).h,
                  Image.asset(
                    AppAssets.logoImage,
                    width: 300,
                  ),
                  (h * 0.01).h,
                  Text(
                    AppString.SIGNUPFORFREE,
                    style: AppTextStyle.boldBlack16.copyWith(fontSize: 18),
                  ),
                  (h * 0.03).h,
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: LoginTextField(
                              controller: controller.firstNameController,
                              labelText: AppString.firstName,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return AppString.enterFirstName;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          (w * 0.02).w,
                          Expanded(
                            child: LoginTextField(
                              controller: controller.lastNameController,
                              labelText: AppString.lastName,
                              validation: (value) {
                                if (value!.isEmpty) {
                                  return AppString.enterLastName;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      (h * 0.015).h,
                      LoginTextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: AppString.email,
                        validation: (value) {
                          bool valid = RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value!);

                          if (value.isEmpty) {
                            return AppString.enterEmail;
                          } else if (!valid) {
                            return AppString.enterValidEmail;
                          } else {
                            return null;
                          }
                        },
                      ),

                      (h * 0.015).h,

                      // Gender Dropdown
                      buildDropdown(
                        AppString.gender,
                        controller.genderList,
                        controller.selectedGender,
                        (value) {
                          controller.selectedGender = value ?? '';
                          controller.update();
                        },
                        h,
                      ),
                      (h * 0.015).h,
                      Row(
                        children: [
                          Expanded(
                            child: buildDropdown(
                              AppString.day,
                              controller.days,
                              controller.selectedDay,
                              (value) {
                                controller.selectedDay = value;
                                controller.update();
                              },
                              h,
                            ),
                          ),
                          (w * 0.02).w,
                          Expanded(
                            child: buildDropdown(
                              AppString.month,
                              controller.months,
                              controller.selectedMonth,
                              (value) {
                                controller.selectedMonth = value;
                                controller.update();
                              },
                              h,
                            ),
                          ),
                          (w * 0.02).w,
                          Expanded(
                            child: buildDropdown(
                              AppString.year,
                              controller.years,
                              controller.selectedYear,
                              (value) {
                                controller.selectedYear = value;
                                controller.update();
                              },
                              h,
                            ),
                          ),
                        ],
                      ),

                      (h * 0.015).h,

                      LoginTextField(
                        controller: controller.passwordController,
                        obSecure: controller.obSecure.value,
                        labelText: AppString.password,
                        validation: (p0) {
                          bool valid = RegExp(".{6,}").hasMatch(p0!);
                          if (valid) {
                            return null;
                          } else {
                            return AppString.enterAtLeast6Characters;
                          }
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.showAndHideObSecureText();
                          },
                          child: Icon(
                            controller.obSecure.value ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),

                      (h * 0.015).h,
                      LoginTextField(
                        controller: controller.confirmPasswordController,
                        labelText: AppString.confirmPassword,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return AppString.enterConfirmPassword;
                          } else {
                            return AppString.passwordNotMatch;
                          }
                        },
                      ),

                      (h * 0.015).h,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1,
                            child: Checkbox(
                              value: controller.agreeToTerms.value,
                              splashRadius: 10,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              side: BorderSide(color: AppColors.greyColor, width: 1.4),
                              activeColor: AppColors.secondaryColor,
                              onChanged: (value) {
                                controller.agreeToTerms.value = value!;
                                controller.update();
                              },
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: AppString.privacyPolicyText,
                                style: AppTextStyle.regularBlack14,
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: AppString.privacyPolicy,
                                    style: AppTextStyle.boldBlack14.copyWith(color: AppColors.secondaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        debugPrint("User Agreement tapped!");
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      (h * 0.03).h,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.026),
                        child: CustomButton(
                          height: 50,
                          isLoading: controller.isLoading.value,
                          title: AppString.signUp,
                          onTap: () async {
                            if (_formKey.currentState!.validate() && controller.agreeToTerms.value) {
                              controller.setLoading(true);
                              await Future.delayed(Duration(seconds: 2));

                              Get.offAllNamed(Routes.HOME);
                              controller.setLoading(false);
                            }
                          },
                          showBoxShadow: true,
                        ),
                      ),
                      (h * 0.04).h,
                      Text.rich(
                        TextSpan(
                          text: AppString.alreadyAnAccount,
                          style: AppTextStyle.regularBlack14,
                          children: <InlineSpan>[
                            TextSpan(
                              text: AppString.logIn,
                              style: AppTextStyle.boldBlack14.copyWith(color: AppColors.secondaryColor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  (h * 0.05).h,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Dropdown Widget
  Widget buildDropdown(String hint, List<String> items, var selectedItem, Function(String?) onChanged, double h) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      menuMaxHeight: h * 0.65,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: AppTextStyle.regularBlack14,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.blackColor)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.blackColor)),
      ),
      style: AppTextStyle.boldBlack14,
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? "Required" : null,
    );
  }
}
