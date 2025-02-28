import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/common/common_button.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/login/controllers/login_controller.dart';
import 'package:artistmagnet/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (h * 0.15).h,
                    Image.asset(
                      AppAssets.logoImage,
                      width: 300,
                    ),
                    (h * 0.07).h,
                    Text(
                      AppString.logInToArtistMagnet,
                      style: AppTextStyle.boldBlack16.copyWith(fontSize: 18),
                    ),
                    (h * 0.04).h,
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
                        labelStyle: AppTextStyle.regularBlack14),
                    (h * 0.02).h,
                    LoginTextField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
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
                        labelStyle: AppTextStyle.regularBlack14),
                    (h * 0.015).h,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1,
                          child: Checkbox(
                            value: controller.isPolicyAccept.value,
                            splashRadius: 10,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(color: AppColors.greyColor, width: 1.4),
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              controller.setPolicyAccept(value ?? false);
                            },
                          ),
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: AppString.byClickingTheLoginButtonYouAgreeToArtistMagnets,
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
                    (h * 0.04).h,
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(AppString.forgotPassword, style: AppTextStyle.boldBlack14.copyWith(color: AppColors.secondaryColor)),
                      ),
                    ),
                    (h * 0.015).h,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.026),
                      child: CustomButton(
                        height: 50,
                        isLoading: controller.isLoading.value,
                        title: AppString.logIn,
                        onTap: () async {
                          Get.offAllNamed(Routes.HOME);
                          // if (formKey.currentState!.validate()) {
                          //   controller.setLoading(true);
                          //   await Future.delayed(Duration(seconds: 2));
                          //   Get.offAllNamed(Routes.HOME);
                          //   controller.setLoading(false);
                          // }
                        },
                        showBoxShadow: true,
                      ),
                    ),
                    (h * 0.04).h,
                    Text.rich(
                      TextSpan(
                        text: AppString.ifYouDontHaveAnAccountYet,
                        style: AppTextStyle.regularBlack14,
                        children: <InlineSpan>[
                          TextSpan(
                            text: AppString.signUp,
                            style: AppTextStyle.boldBlack14.copyWith(color: AppColors.secondaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.SIGNUP);
                              },
                          ),
                        ],
                      ),
                    ),
                    (h * 0.05).h,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
