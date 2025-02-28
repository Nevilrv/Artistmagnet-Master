import 'package:artistmagnet/app/common/app_dialog.dart';
import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Drawer(
      width: w * 0.65,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: AppColors.whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (h * 0.05).h,
            Image.asset(AppAssets.logoImage).paddingSymmetric(horizontal: w * 0.05),
            Divider(),
            InkWell(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.BUILD_A_RESUME);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.buildResume,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                AppDialog.resumeBuilderDialog(context, h);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.resumeBuilder,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                AppDialog.becomePowerMagnetDialog(context, h, w);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.becomeAPowerMagnet,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                AppDialog.becomeSuperMagnet(context, h);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.becomeASuperMagnet,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.ACCOUNT_SETTING);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.accountSetting,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.addFriends,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
                Get.toNamed(Routes.MANAGE_RESUMES);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.manageResumes,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                width: w,
                child: Text(
                  AppString.logOut,
                  style: AppTextStyle.regularBlack14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
