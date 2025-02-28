import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/comman_textfield.dart';
import '../../../core/values/app_color.dart';
import '../../../core/values/app_string.dart';
import '../controllers/manage_resumes_controller.dart';

class ManageResumesView extends GetView<ManageResumesController> {
  const ManageResumesView({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentColor,
        shadowColor: AppColors.greyColor,
        elevation: 4,
        centerTitle: true,
        title: Text(AppString.manageResume),
        titleTextStyle: AppTextStyle.regularBlack16,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.buildYourFirstResume,
                style: AppTextStyle.boldRed16,
              ).paddingOnly(top: h * 0.03, bottom: h * 0.02),
              Text(
                AppString.welcomeToArtistMagnet,
                style: AppTextStyle.regularBlack12,
              ),
              (h * 0.02).h,
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.10, vertical: h * 0.010),
                  decoration: BoxDecoration(
                    gradient: AppColors.redColorGradient,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    AppString.buildResume,
                    style: AppTextStyle.regularBlack14.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
              (h * 0.02).h,
              Text(
                AppString.orHaveArtistMagnetBuildYorResumeForYou,
                style: AppTextStyle.boldRed14,
              ),
              (h * 0.04).h,
              Text(
                AppString.pleaseEnterHere,
                style: AppTextStyle.boldBlack14,
              ),
              (h * 0.01).h,
              CommonTextField(),
              (h * 0.02).h,
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.015, vertical: h * 0.010),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [BoxShadow(color: AppColors.greyColor2, offset: Offset(2, 2), blurRadius: 2, spreadRadius: 0)],
                      gradient: LinearGradient(
                        colors: [Color(0xFFaadeea), Color(0xFF33cbfe)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 50],
                      )),
                  child: Text(
                    AppString.resumeBuilder,
                    style: AppTextStyle.regularBlack14.copyWith(color: AppColors.whiteColor),
                  ),
                ),
              ),
              (h * 0.04).h,
              Text(
                AppString.emailUsAtAdminTxt,
                style: AppTextStyle.regularBlack12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
