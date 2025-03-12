import 'dart:io';

import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/common/common_button.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/buildAResume/views/build_resume_page_2_view.dart';
import 'package:artistmagnet/app/modules/buildAResume/widgets/add_theater_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/app_color.dart';
import '../controllers/build_a_resume_controller.dart';

class BuildAResumeView extends GetView<BuildAResumeController> {
  const BuildAResumeView({super.key});

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
          title: const Text(AppString.buildResume),
          titleTextStyle: AppTextStyle.regularBlack16,
          leading: GestureDetector(
              onTap: () {
                if (controller.pageController.page == 1.0) {
                  controller.pageController.previousPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeIn);
                } else {
                  Get.back();
                }
              },
              child: Icon(Icons.arrow_back_rounded)),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            /// FIRST PAGE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: SingleChildScrollView(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Obx(
                    () {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (w * 0.05).h,
                          Text.rich(
                            TextSpan(
                              text: AppString.resumeType,
                              style: AppTextStyle.regularBlack12,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "*",
                                  style: AppTextStyle.boldRed14,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          (h * 0.001).h,
                          Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 1,
                                        groupValue:
                                            controller.selectedRadio.value,
                                        activeColor: AppColors
                                            .redColor, // Radio fill color set
                                        onChanged: (value) {
                                          controller.selectedRadio.value =
                                              value!;
                                        },
                                      ),
                                      Text(
                                        "Option 1",
                                        style: AppTextStyle.regularBlack12,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 2,
                                        groupValue:
                                            controller.selectedRadio.value,
                                        activeColor: AppColors
                                            .redColor, // Radio fill color set
                                        onChanged: (value) {
                                          controller.selectedRadio.value =
                                              value!;
                                        },
                                      ),
                                      Text(
                                        "Option 2",
                                        style: AppTextStyle.regularBlack12,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<int>(
                                        value: 3,
                                        groupValue:
                                            controller.selectedRadio.value,
                                        activeColor: AppColors
                                            .redColor, // Radio fill color set
                                        onChanged: (value) {
                                          controller.selectedRadio.value =
                                              value!;
                                        },
                                      ),
                                      Text(
                                        "Option 3",
                                        style: AppTextStyle.regularBlack12,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Text.rich(
                            TextSpan(
                              text: AppString.stageName,
                              style: AppTextStyle.regularBlack12,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "*",
                                  style: AppTextStyle.boldRed14,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          (h * 0.01).h,
                          CommonTextField(),
                          (h * 0.02).h,
                          Text.rich(
                            TextSpan(
                              text: AppString.resumeTitle,
                              style: AppTextStyle.regularBlack12,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "*",
                                  style: AppTextStyle.boldRed14,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          (h * 0.01).h,
                          CommonTextField(),
                          (h * 0.02).h,
                          Text(AppString.pronouns,
                              style: AppTextStyle.regularBlack12),
                          (h * 0.01).h,
                          CommonTextField(),
                          (h * 0.02).h,
                          Text(AppString.unionGuildAffiliations,
                              style: AppTextStyle.regularBlack12),
                          (h * 0.01).h,
                          CommonTextField(),
                          (h * 0.04).h,
                          Text(
                            AppString.contactInfo,
                            style: AppTextStyle.boldBlack16,
                          ),
                          (h * 0.02).h,
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.020, horizontal: w * 0.040),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.lightGrey.withValues(alpha: 0.50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextField(
                                  hintText: AppString.streetAddress1,
                                ),
                                (h * 0.020).h,
                                CommonTextField(
                                  hintText: AppString.streetAddress2,
                                ),
                                (h * 0.020).h,
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.phone1,
                                      ),
                                    ),
                                    (w * 0.02).w,
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.phone2,
                                      ),
                                    )
                                  ],
                                ),
                                (h * 0.020).h,
                                CommonTextField(
                                  hintText: AppString.email,
                                ),
                                (h * 0.020).h,
                                CommonTextField(
                                  hintText: AppString.website,
                                ),
                                (h * 0.020).h,
                                CommonTextField(
                                  hintText: AppString.country,
                                  width: w * 0.400,
                                ),
                                (h * 0.020).h,
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.city,
                                      ),
                                    ),
                                    (w * 0.02).w,
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.state,
                                      ),
                                    ),
                                    (w * 0.02).w,
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.zipCode,
                                      ),
                                    )
                                  ],
                                ),
                                (h * 0.020).h,
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.socialMediaLink1,
                                      ),
                                    ),
                                    (w * 0.02).w,
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.socialMediaLink2,
                                      ),
                                    ),
                                    (w * 0.02).w,
                                    Expanded(
                                      child: CommonTextField(
                                        hintText: AppString.socialMediaLink3,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          (h * 0.040).h,
                          Text(
                            AppString.media,
                            style: AppTextStyle.boldBlack16,
                          ),
                          (h * 0.02).h,
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.020, horizontal: w * 0.040),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.lightGrey.withValues(alpha: 0.50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppString.imagesMustBeLessTxt,
                                  style: AppTextStyle.regularBlack12,
                                ),
                                (h * 0.010).h,
                                Text(
                                  AppString.ourWebServicesChargeTxt,
                                  style: AppTextStyle.regularBlack12,
                                ),
                                (h * 0.020).h,

                                /// IMAGE
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.pickImage1();
                                          },
                                          child: SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: controller.image.value ==
                                                    null
                                                ? Image.asset(AppAssets.gallery,
                                                    fit: BoxFit.cover)
                                                : Image.file(
                                                    controller.image.value!,
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          right: w * 0.0 - 16,
                                          top: w * 0.025,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.removeImage1();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.005),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.greyColor2,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 2,
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFaadeea),
                                                    Color(0xFF33cbfe),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, 50],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (w * 0.050)
                                        .w, // Space between Stack and Column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            height:
                                                80, // Adjust height as needed
                                            decoration: BoxDecoration(),
                                            child:
                                                controller.images.isEmpty ||
                                                        controller.images == []
                                                    ? Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              becomePowerMagnetDialog(
                                                                  context,
                                                                  h,
                                                                  w);
                                                            },
                                                            child: SizedBox(
                                                              height: 70,
                                                              width: 70,
                                                              child: controller
                                                                          .image1
                                                                          .value ==
                                                                      null
                                                                  ? Image.asset(
                                                                      AppAssets
                                                                          .gallery,
                                                                      fit: BoxFit
                                                                          .cover)
                                                                  : Image.file(
                                                                      controller
                                                                          .image1
                                                                          .value!,
                                                                      fit: BoxFit
                                                                          .cover),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -10,
                                                            top: 10,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .removeImage2();
                                                              },
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            w * 0.005),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors
                                                                          .greyColor2,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              2),
                                                                      blurRadius:
                                                                          2,
                                                                      spreadRadius:
                                                                          0,
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFaadeea),
                                                                      Color(
                                                                          0xFF33cbfe),
                                                                    ],
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    stops: [
                                                                      0,
                                                                      50
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 15,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : ListView.builder(
                                                        itemCount: controller
                                                            .images.length,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .pickImage(
                                                                            index);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 70,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                              .grey[
                                                                          200],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child: controller.images[index]["image"] ==
                                                                                null ||
                                                                            controller.images[index]["image"] ==
                                                                                ""
                                                                        ? Image.asset(controller.images[index]
                                                                            [
                                                                            "default"])
                                                                        : Image
                                                                            .file(
                                                                            File(controller.images[index]["image"]),
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                70,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: -10,
                                                                  top: 10,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .removeImage(
                                                                              index);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              w * 0.005),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                AppColors.greyColor2,
                                                                            offset:
                                                                                Offset(2, 2),
                                                                            blurRadius:
                                                                                2,
                                                                            spreadRadius:
                                                                                0,
                                                                          )
                                                                        ],
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFaadeea),
                                                                            Color(0xFF33cbfe),
                                                                          ],
                                                                          begin:
                                                                              Alignment.topCenter,
                                                                          end: Alignment
                                                                              .bottomCenter,
                                                                          stops: [
                                                                            0,
                                                                            50
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            15,
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                          ),
                                          (h * 0.035).h,
                                          GestureDetector(
                                            onTap: () {
                                              becomePowerMagnetDialog(
                                                  context, h, w);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.010,
                                                  vertical: 2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                              child: Text(
                                                "Add more images",
                                                style: AppTextStyle
                                                    .semiboldBlack12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                (h * 0.040).h,

                                /// VIDEO
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            becomePowerMagnetDialog(
                                                context, h, w);
                                          },
                                          child: SizedBox(
                                            height: 150,
                                            width: 150,
                                            child: Image.asset(
                                                AppAssets.videoIcon,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          right: w * 0.0 - 16,
                                          top: w * 0.025,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.005),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.greyColor2,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 2,
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFaadeea),
                                                    Color(0xFF33cbfe),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  stops: [0, 50],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (w * 0.050)
                                        .w, // Space between Stack and Column
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            height:
                                                80, // Adjust height as needed
                                            decoration: BoxDecoration(),
                                            child:
                                                controller.images.isEmpty ||
                                                        controller.images == []
                                                    ? Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              becomePowerMagnetDialog(
                                                                  context,
                                                                  h,
                                                                  w);
                                                            },
                                                            child: SizedBox(
                                                              height: 70,
                                                              width: 70,
                                                              child: controller
                                                                          .image1
                                                                          .value ==
                                                                      null
                                                                  ? Image.asset(
                                                                      AppAssets
                                                                          .videoIcon,
                                                                      fit: BoxFit
                                                                          .cover)
                                                                  : Image.file(
                                                                      controller
                                                                          .image1
                                                                          .value!,
                                                                      fit: BoxFit
                                                                          .cover),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: -10,
                                                            top: 10,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            w * 0.005),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors
                                                                          .greyColor2,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              2),
                                                                      blurRadius:
                                                                          2,
                                                                      spreadRadius:
                                                                          0,
                                                                    )
                                                                  ],
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFaadeea),
                                                                      Color(
                                                                          0xFF33cbfe),
                                                                    ],
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    stops: [
                                                                      0,
                                                                      50
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Icon(
                                                                  Icons.remove,
                                                                  size: 15,
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : ListView.builder(
                                                        itemCount: controller
                                                            .images.length,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5),
                                                            child: Stack(
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    width: 70,
                                                                    height: 70,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                              .grey[
                                                                          200],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child: controller.images[index]["image"] ==
                                                                                null ||
                                                                            controller.images[index]["image"] ==
                                                                                ""
                                                                        ? Image.asset(controller.images[index]
                                                                            [
                                                                            "default"])
                                                                        : Image
                                                                            .file(
                                                                            File(controller.images[index]["image"]),
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                70,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: -10,
                                                                  top: 10,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () {},
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              w * 0.005),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                AppColors.greyColor2,
                                                                            offset:
                                                                                Offset(2, 2),
                                                                            blurRadius:
                                                                                2,
                                                                            spreadRadius:
                                                                                0,
                                                                          )
                                                                        ],
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Color(0xFFaadeea),
                                                                            Color(0xFF33cbfe),
                                                                          ],
                                                                          begin:
                                                                              Alignment.topCenter,
                                                                          end: Alignment
                                                                              .bottomCenter,
                                                                          stops: [
                                                                            0,
                                                                            50
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove,
                                                                        size:
                                                                            15,
                                                                        color: AppColors
                                                                            .whiteColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                          ),
                                          (h * 0.035).h,
                                          GestureDetector(
                                            onTap: () {
                                              becomePowerMagnetDialog(
                                                  context, h, w);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.010,
                                                  vertical: 2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                              child: Text(
                                                "Add more video",
                                                style: AppTextStyle
                                                    .semiboldBlack12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          (h * 0.04).h,
                          Obx(
                            () {
                              if (!controller.isSectionVisible.value) {
                                return Row(
                                  children: [
                                    Text(
                                      '.',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    (w * 0.03).w,
                                    GestureDetector(
                                      onTap: controller.addNewSection,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            color: Colors.red),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Text(
                                            "Add new Representation section",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // controller.resetGrayBackground();
                                    },
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: controller.toggleEditing,
                                          child: Container(
                                            padding: controller.isEditing.value
                                                ? EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 0)
                                                : EdgeInsets.zero,
                                            decoration: BoxDecoration(
                                              color: controller
                                                      .showGrayBackground.value
                                                  ? Colors.grey[200]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: SizedBox(
                                              width: controller.isEditing.value
                                                  ? w * 0.4
                                                  : w * 0.3,
                                              child: controller.isEditing.value
                                                  ? CommonTextField(
                                                      controller: controller
                                                          .textController
                                                        ..text = controller
                                                            .text.value,
                                                      onChanged: (value) =>
                                                          controller.updateText(
                                                              value),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : Text(
                                                      controller.text.value,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: w * 0.030),
                                        !controller.isEditing.value
                                            ? GestureDetector(
                                                onTap: controller.toggleEditing,
                                                child: Image.asset(
                                                  'assets/images/edit.png',
                                                  height: 22,
                                                  color: Color(0xFF33cbfe),
                                                ),
                                              )
                                            : Image.asset(
                                                'assets/images/edit.png',
                                                height: 22,
                                                color: Color(0xFFaadeea),
                                              ),
                                        SizedBox(width: w * 0.030),
                                        GestureDetector(
                                          onTap: () {
                                            controller.showConfirmationDialog();
                                          },
                                          child: Container(
                                            height: 20,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.005),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.greyColor2,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 2,
                                                  spreadRadius: 0,
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFaadeea),
                                                  Color(0xFF33cbfe),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0, 50],
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: AppColors.whiteColor,
                                              size: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  (h * 0.01).h,
                                  CommonTextField(
                                    hintText: "",
                                    maxLine: 3,
                                  ),
                                  (h * 0.04).h,
                                ],
                              );
                            },
                          ),
                          if (!controller.isSectionVisible.value) (h * 0.04).h,
                          Text.rich(
                            TextSpan(
                              text: AppString.theatre,
                              style: AppTextStyle.boldBlack16,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "*",
                                  style: AppTextStyle.boldRed14,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                          (h * 0.02).h,
                          Container(
                            width: w,
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.020, horizontal: w * 0.040),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.lightGrey.withValues(alpha: 0.50),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("*At least one credit is required."),
                                10.0.h,
                                ReorderableListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  onReorder: controller.onReorderTheater,
                                  children: List.generate(
                                    controller.theater?.length ?? 0,
                                    (index) {
                                      return Column(
                                        key: ValueKey(index),
                                        children: [
                                          Container(
                                            width: w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(
                                              color: AppColors.lightGrey,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                          "Production: ",
                                                          style: AppTextStyle
                                                              .boldBlack14),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Text(
                                                          "${controller.theater?[index].production}",
                                                          style: AppTextStyle
                                                              .regularBlack14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text("Role: ",
                                                          style: AppTextStyle
                                                              .boldBlack14),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Text(
                                                          "${controller.theater?[index].role}",
                                                          style: AppTextStyle
                                                              .regularBlack14),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text("Director: ",
                                                          style: AppTextStyle
                                                              .boldBlack14),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Text(
                                                          "${controller.theater?[index].director}",
                                                          style: AppTextStyle
                                                              .regularBlack14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // Space between list items
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                30.0.h,
                                GestureDetector(
                                  onTap: () {
                                    controller.clearTheaterData();
                                    showModalBottomSheet(
                                      context: context,
                                      barrierColor:
                                          Colors.black.withValues(alpha: 0.72),
                                      isDismissible: true,
                                      builder: (context) {
                                        return AddTheaterDialog();
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.010, vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.blackColor),
                                    ),
                                    child: Text(
                                      "Add Credit",
                                      style: AppTextStyle.semiboldBlack12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          30.0.h,
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: w * 0.026),
                            child: CustomButton(
                              height: 45,
                              isLoading: false,
                              title: "Next",
                              onTap: () async {
                                controller.pageController.nextPage(
                                    duration: Duration(milliseconds: 800),
                                    curve: Curves.easeIn);
                              },
                              showBoxShadow: true,
                            ),
                          ),
                          50.0.h,
                        ],
                      );
                    },
                  )),
            ),

            /// SECOND PAGE
            BuildResumePage2View()
          ],
        ));
  }

  static void becomePowerMagnetDialog(
      BuildContext context, double h, double w) {
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
                borderRadius:
                    BorderRadius.circular(0), // Optional: Rounded corners
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: double.infinity, // Full-width

                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 40, right: 30, left: 40, top: 15),
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
                        AppString
                            .becomeAPowerMagnetAndYouWillHaveAccessFollowing,
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.yellowColor),
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
