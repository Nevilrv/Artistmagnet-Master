import 'package:artistmagnet/app/common/app_drawer.dart';
import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentColor,
        shadowColor: AppColors.greyColor,
        elevation: 4,
        centerTitle: true,
        title: const Text(AppString.home),
        titleTextStyle: AppTextStyle.regularBlack16,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Container(
                margin: EdgeInsets.symmetric(vertical: h * 0.02),
                height: h * 0.050,
                decoration: BoxDecoration(border: Border.all(color: AppColors.lightGrey)),
                child: TextFormField(
                  cursorColor: AppColors.blackColor,
                  cursorWidth: 1,
                  style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 4, left: 15),
                      hintText: AppString.enhancedBy,
                      hintStyle: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12),
                      suffixIcon: Container(
                        height: h * 0.050,
                        width: w * 0.01,
                        decoration: BoxDecoration(color: AppColors.blueColor, border: Border.all(color: AppColors.blackColor)),
                        child: Icon(
                          Icons.search,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Text(AppString.homeInviteTxt, style: AppTextStyle.semiBoldBlack16MyriadPro.copyWith(fontSize: 19)),
              Container(
                margin: EdgeInsets.only(top: h * 0.01, bottom: h * 0.004),
                decoration: BoxDecoration(color: AppColors.blueColor, borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.008, vertical: h * 0.004),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: AppColors.whiteColor,
                        size: 0.020 * h,
                      ),
                      Text(
                        AppString.share757,
                        style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 10, color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                AppString.homeStepTxt,
                style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 14),
              ).paddingOnly(bottom: h * 0.015),
              Row(
                children: [
                  Text(
                    "1 ",
                    style: AppTextStyle.boldBlack16MyriadPro.copyWith(fontSize: 14),
                  ),
                  Text(
                    AppString.step1,
                    style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2 ",
                    style: AppTextStyle.boldBlack16MyriadPro.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      AppString.step2,
                      style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12, overflow: TextOverflow.visible),
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: h * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3 ",
                    style: AppTextStyle.boldBlack16MyriadPro.copyWith(fontSize: 14),
                  ),
                  Expanded(
                    child: Text(
                      AppString.step3,
                      style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12, overflow: TextOverflow.visible),
                    ),
                  ),
                ],
              ),
              Text(
                AppString.asAThankYouTxt,
                style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12, overflow: TextOverflow.visible),
              ).paddingSymmetric(vertical: h * 0.02),
              Text(
                AppString.afterYouHave,
                style:
                    AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 12, overflow: TextOverflow.visible, color: AppColors.redColor),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.blueColor, borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.008, vertical: h * 0.004),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: AppColors.whiteColor,
                        size: 0.020 * h,
                      ),
                      Text(
                        AppString.share757,
                        style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 10, color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
              ).paddingOnly(top: h * 0.02, bottom: h * 0.004),
              Text(
                AppString.clickTheShare,
                style: AppTextStyle.regularBlack16MyriadPro.copyWith(fontSize: 14),
              ),*/
              Text(
                AppString.inviteEmail,
                style: AppTextStyle.semiBoldBlack16.copyWith(fontSize: 20),
              ).paddingOnly(top: h * 0.02, bottom: h * 0.002),
              Text.rich(
                TextSpan(
                  text: AppString.inviteAtLeastPeopleTxt,
                  style: AppTextStyle.regularBlack14,
                  children: <InlineSpan>[
                    TextSpan(
                      text: AppString.powerMagnet,
                      style: AppTextStyle.boldRed14,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: AppString.membershipForOneMonthForFree,
                      style: AppTextStyle.regularBlack14,
                    ),
                  ],
                ),
              ),
              Text(
                AppString.afterYouHaveInvitedTxt,
                style: AppTextStyle.regularRed12,
              ).paddingSymmetric(vertical: h * 0.02),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyColor.withValues(alpha: 0.40),
                        offset: Offset(3, 3),
                        spreadRadius: 0,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
                    child: Text(
                      AppString.yourSentInvitations,
                      style: AppTextStyle.regularBlack12,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: h * 0.020, horizontal: w * 0.040),
                width: double.infinity,
                color: AppColors.lightGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: AppColors.whiteColor,
                                child: TextFormField(
                                  cursorColor: AppColors.blackColor,
                                  cursorWidth: 1,
                                  style: AppTextStyle.regularBlack12,
                                  decoration: InputDecoration(
                                      hintText: AppString.artistsFirstName,
                                      hintStyle: AppTextStyle.regularBlack12,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: w * 0.020),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                            (w * 0.02).w,
                            Expanded(
                              child: Container(
                                color: AppColors.whiteColor,
                                child: TextFormField(
                                  cursorColor: AppColors.blackColor,
                                  cursorWidth: 1,
                                  style: AppTextStyle.regularBlack12,
                                  decoration: InputDecoration(
                                      hintText: AppString.artistsLastName,
                                      hintStyle: AppTextStyle.regularBlack12,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: w * 0.020),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: AppColors.whiteColor,
                                child: TextFormField(
                                  cursorColor: AppColors.blackColor,
                                  cursorWidth: 1,
                                  style: AppTextStyle.regularBlack12,
                                  decoration: InputDecoration(
                                      hintStyle: AppTextStyle.regularBlack12,
                                      hintText: AppString.artistsEmail,
                                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: w * 0.020),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                            (w * 0.02).w,
                            Container(
                              color: AppColors.whiteColor,
                              child: Padding(
                                padding: EdgeInsets.all(h * 0.013),
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(vertical: h * 0.02),
                        Container(
                          height: 70,
                          color: AppColors.whiteColor,
                          child: TextFormField(
                            cursorColor: AppColors.blackColor,
                            cursorWidth: 1,
                            maxLines: 3,
                            style: AppTextStyle.regularBlack12,
                            decoration: InputDecoration(
                                hintText: AppString.customMessageToTheArtist,
                                hintStyle: AppTextStyle.regularBlack12,
                                contentPadding: EdgeInsets.symmetric(vertical: h * 0.015, horizontal: w * 0.020),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: AppColors.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.all(h * 0.013),
                        child: Icon(Icons.add),
                      ),
                    ).paddingSymmetric(vertical: h * 0.02),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.010),
                        decoration: BoxDecoration(
                          gradient: AppColors.redColorGradient,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          AppString.continueTxt,
                          style: AppTextStyle.regularBlack14.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    )
                  ],
                ),
              ).paddingSymmetric(vertical: h * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  ///Drawer

  Widget selectDateTimeDialog(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Optional: Rounded corners
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
          width: double.infinity, // Full-width

          child: Padding(
            padding: EdgeInsets.only(bottom: 40, right: 40, left: 40, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppString.resumeBuilder,
                  style: AppTextStyle.boldRed20,
                ),
              ],
            ),
          )),
    );
  }
}
