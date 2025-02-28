import 'dart:io';

import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/common/comman_textfield.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(
          surfaceTintColor: AppColors.transparentColor,
          backgroundColor: AppColors.whiteColor,
          title: const Text(AppString.buildResume),
          titleTextStyle: AppTextStyle.regularBlack14,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: SingleChildScrollView(child: Obx(
            () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: AppString.resumeType,
                      style: AppTextStyle.regularBlack12,
                      children: <InlineSpan>[
                        TextSpan(
                          text: "*",
                          style: AppTextStyle.boldRed14,
                          recognizer: TapGestureRecognizer()..onTap = () {},
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
                                groupValue: controller.selectedRadio.value,
                                activeColor: AppColors.redColor, // Radio fill color set
                                onChanged: (value) {
                                  controller.selectedRadio.value = value!;
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
                                groupValue: controller.selectedRadio.value,
                                activeColor: AppColors.redColor, // Radio fill color set
                                onChanged: (value) {
                                  controller.selectedRadio.value = value!;
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
                                groupValue: controller.selectedRadio.value,
                                activeColor: AppColors.redColor, // Radio fill color set
                                onChanged: (value) {
                                  controller.selectedRadio.value = value!;
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
                          recognizer: TapGestureRecognizer()..onTap = () {},
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
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  (h * 0.01).h,
                  CommonTextField(),
                  (h * 0.02).h,
                  Text(AppString.pronouns, style: AppTextStyle.regularBlack12),
                  (h * 0.01).h,
                  CommonTextField(),
                  (h * 0.02).h,
                  Text(AppString.unionGuildAffiliations, style: AppTextStyle.regularBlack12),
                  (h * 0.01).h,
                  CommonTextField(),
                  (h * 0.04).h,
                  Text(
                    AppString.contactInfo,
                    style: AppTextStyle.regularBlack14,
                  ),
                  (h * 0.02).h,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: h * 0.020, horizontal: w * 0.040),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withValues(alpha: 0.50),
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
                    style: AppTextStyle.regularBlack14,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: h * 0.020, horizontal: w * 0.040),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withValues(alpha: 0.50),
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
                                    child: controller.image.value == null
                                        ? Image.asset(AppAssets.gallery, fit: BoxFit.cover)
                                        : Image.file(controller.image.value!, fit: BoxFit.cover),
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
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                            (w * 0.050).w, // Space between Stack and Column
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height: 80, // Adjust height as needed
                                    decoration: BoxDecoration(),
                                    child: controller.images.isEmpty || controller.images == []
                                        ? Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller.pickImage2();
                                                },
                                                child: SizedBox(
                                                  height: 70,
                                                  width: 70,
                                                  child: controller.image1.value == null
                                                      ? Image.asset(AppAssets.gallery, fit: BoxFit.cover)
                                                      : Image.file(controller.image1.value!, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Positioned(
                                                right: -10,
                                                top: 10,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.removeImage2();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                                                      size: 15,
                                                      color: AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : ListView.builder(
                                            itemCount: controller.images.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.pickImage(index);
                                                      },
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[200],
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: controller.images[index]["image"] == null ||
                                                                controller.images[index]["image"] == ""
                                                            ? Image.asset(controller.images[index]["default"])
                                                            : Image.file(
                                                                File(controller.images[index]["image"]),
                                                                height: 70,
                                                                width: 70,
                                                                fit: BoxFit.cover,
                                                              ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      top: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller.removeImage(index);
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                                                            size: 15,
                                                            color: AppColors.whiteColor,
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
                                      controller.addImage();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.010, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.blackColor),
                                      ),
                                      child: Text(
                                        "Add more images",
                                        style: AppTextStyle.semiboldBlack12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        (h * 0.040).h,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: controller.image.value == null
                                        ? Image.asset(AppAssets.videoIcon, fit: BoxFit.cover)
                                        : Image.file(controller.image.value!, fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  right: w * 0.0 - 16,
                                  top: w * 0.025,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                            (w * 0.050).w, // Space between Stack and Column
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height: 80, // Adjust height as needed
                                    decoration: BoxDecoration(),
                                    child: controller.images.isEmpty || controller.images == []
                                        ? Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: SizedBox(
                                                  height: 70,
                                                  width: 70,
                                                  child: controller.image1.value == null
                                                      ? Image.asset(AppAssets.gallery, fit: BoxFit.cover)
                                                      : Image.file(controller.image1.value!, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Positioned(
                                                right: -10,
                                                top: 10,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                                                      size: 15,
                                                      color: AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : ListView.builder(
                                            itemCount: controller.images.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 70,
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                          color: Colors.grey[200],
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: controller.images[index]["image"] == null ||
                                                                controller.images[index]["image"] == ""
                                                            ? Image.asset(controller.images[index]["default"])
                                                            : Image.file(
                                                                File(controller.images[index]["image"]),
                                                                height: 70,
                                                                width: 70,
                                                                fit: BoxFit.cover,
                                                              ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: -10,
                                                      top: 10,
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          padding: EdgeInsets.symmetric(horizontal: w * 0.005),
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
                                                            size: 15,
                                                            color: AppColors.whiteColor,
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
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: w * 0.010, vertical: 2),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.blackColor),
                                      ),
                                      child: Text(
                                        "Add more video",
                                        style: AppTextStyle.semiboldBlack12,
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
                  (h * 0.070).h,
                ],
              );
            },
          )),
        ));
  }
}
