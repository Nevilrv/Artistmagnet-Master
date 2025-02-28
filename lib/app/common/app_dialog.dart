import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppDialog {
  static void resumeBuilderDialog(BuildContext context, double h) {
    Future.delayed(
      Duration.zero,
      () {
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierColor: Colors.black.withValues(alpha: 0.72),
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              alignment: Alignment.topCenter,
              shadowColor: AppColors.blackColor,
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Optional: Rounded corners
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity, // Full-width

                child: Padding(
                  padding: EdgeInsets.only(bottom: 40, right: 30, left: 40, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back)),
                      ),
                      Text(
                        AppString.resumeBuilder,
                        style: AppTextStyle.boldRed20,
                      ),
                      (h * 0.04).h,
                      Text(
                        AppString.haveArtistMagnetBuildResume,
                        style: AppTextStyle.regularBlack12,
                      ),
                      (h * 0.02).h,
                      Container(
                        height: h * 0.060,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.yellowColor),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.paypalIcon,
                            height: h * 0.025,
                          ),
                        ),
                      ),
                      (h * 0.007).h,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppString.theSafer,
                          style: AppTextStyle.regularBlack12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void becomePowerMagnetDialog(BuildContext context, double h, double w) {
    Future.delayed(
      Duration.zero,
      () {
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierColor: Colors.black.withValues(alpha: 0.72),
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              alignment: Alignment.bottomCenter,
              shadowColor: AppColors.blackColor,
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Optional: Rounded corners
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity, // Full-width

                child: Padding(
                  padding: EdgeInsets.only(bottom: 40, right: 30, left: 40, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppString.becomeAPowerMagnet,
                            style: AppTextStyle.boldRed20,
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back)),
                        ],
                      ),
                      (h * 0.02).h,
                      Text(
                        AppString.becomeAPowerMagnetAndYouWillHaveAccessFollowing,
                        style: AppTextStyle.regularBlack12,
                      ),
                      (h * 0.02).h,
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: h * 0.006),
                              child: Container(
                                height: h * 0.010,
                                width: h * 0.010,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            (w * 0.03).w,
                            Expanded(
                              child: Text(
                                AppString.buildSavePrintAndShare,
                                style: AppTextStyle.regularBlack12,
                              ),
                            )
                          ],
                        ),
                      ),
                      (h * 0.02).h,
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: h * 0.006),
                              child: Container(
                                height: h * 0.010,
                                width: h * 0.010,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            (w * 0.03).w,
                            Expanded(
                              child: Text(
                                AppString.uploadUnlimitedHeadshots,
                                style: AppTextStyle.regularBlack12,
                              ),
                            )
                          ],
                        ),
                      ),
                      (h * 0.02).h,
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: h * 0.006),
                              child: Container(
                                height: h * 0.010,
                                width: h * 0.010,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            (w * 0.03).w,
                            Expanded(
                              child: Text(
                                AppString.makeCustomUrlsForYourResume,
                                style: AppTextStyle.regularBlack12,
                              ),
                            )
                          ],
                        ),
                      ),
                      (h * 0.02).h,
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: h * 0.006),
                              child: Container(
                                height: h * 0.010,
                                width: h * 0.010,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            (w * 0.03).w,
                            Expanded(
                              child: Text(
                                AppString.wellShareYourResumeTxt,
                                style: AppTextStyle.regularBlack12,
                              ),
                            )
                          ],
                        ),
                      ),
                      (h * 0.02).h,
                      Text(
                        AppString.ourWebServicesChargeTxt,
                        style: AppTextStyle.regularBlack12,
                      ),
                      (h * 0.02).h,
                      Container(
                        height: h * 0.060,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.yellowColor),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.paypalIcon,
                            height: h * 0.025,
                          ),
                        ),
                      ),
                      (h * 0.007).h,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppString.theSafer,
                          style: AppTextStyle.regularBlack12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void becomeSuperMagnet(BuildContext context, double h) {
    Future.delayed(
      Duration.zero,
      () {
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierColor: Colors.black.withValues(alpha: 0.72),
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              alignment: Alignment.topCenter,
              shadowColor: AppColors.blackColor,
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // Optional: Rounded corners
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity, // Full-width

                child: Padding(
                  padding: EdgeInsets.only(bottom: 40, right: 30, left: 40, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppString.becomeASuperMagnet,
                            style: AppTextStyle.boldRed20,
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back)),
                        ],
                      ),
                      (h * 0.02).h,
                      Text(
                        AppString.becomeASuperMagnetTxt,
                        style: AppTextStyle.regularBlack12,
                      ),
                      (h * 0.02).h,
                      Text(
                        AppString.ourWebServicesChargesTxt,
                        style: AppTextStyle.regularBlack12,
                      ),
                      (h * 0.02).h,
                      Container(
                        height: h * 0.060,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.yellowColor),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.paypalIcon,
                            height: h * 0.025,
                          ),
                        ),
                      ),
                      (h * 0.007).h,
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppString.theSafer,
                          style: AppTextStyle.regularBlack12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
