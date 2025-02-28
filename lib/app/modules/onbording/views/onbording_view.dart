import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/extentions/size_box.dart';
import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:artistmagnet/app/core/values/app_string.dart';
import 'package:artistmagnet/app/modules/onbording/controllers/onbording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'logoHero',
          child: Image.asset(
            AppAssets.logoImage,
            width: 200,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isVideoInitialized.value
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (h * 0.05).h,
                    Expanded(
                      child: PageView.builder(
                        controller: controller.pageController,
                        itemCount: 3,
                        onPageChanged: (value) {
                          controller.changeIndex(value);
                        },
                        itemBuilder: (context, index) {
                          controller.selectedIndex.value = index;
                          return AnimatedBuilder(
                            animation: controller.pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (controller.pageController.position.haveDimensions) {
                                value = controller.pageController.page! - index;
                                value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                              }
                              return Transform.scale(scale: value, child: child);
                            },
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: controller.selectedIndex.value == 0
                                  ? firstPage(h, w)
                                  : controller.selectedIndex.value == 1
                                      ? secondPage(h, w)
                                      : thirdPage(h, w),
                            ),
                          );
                        },
                      ),
                    ),
                    (h * 0.01).h,
                    SmoothPageIndicator(
                      controller: controller.pageController, // PageController
                      count: 3,
                      effect: WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: AppColors.greyColor.withValues(alpha: 0.3),
                        activeDotColor: AppColors.greyColor,
                      ), // your preferred effect
                      onDotClicked: (index) {},
                    ),
                    (h * 0.03).h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => controller.onTapSkipButton(),
                          child: Text(
                            AppString.skip,
                            style: AppTextStyle.boldBlack14.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.onTapNextButton(),
                          child: Container(
                            margin: EdgeInsets.only(right: w * 0.044),
                            height: h * 0.06,
                            width: h * 0.065,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.arrow_forward, color: AppColors.whiteColor),
                          ),
                        )
                      ],
                    ),
                    (h * 0.03).h,
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }

  SingleChildScrollView firstPage(double h, double w) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          controller.isVideoInitialized.value
              ? Center(
                  child: SizedBox(
                    width: w,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width: controller.videoPlayerController.value.size.width,
                          height: controller.videoPlayerController.value.size.height,
                          child: VideoPlayer(
                            controller.videoPlayerController,
                          )),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          (h * 0.05).h,
          Text(
            AppString.onBoarding1Title,
            style: AppTextStyle.semiBoldBlack16,
          ),
          (h * 0.03).h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.square, color: AppColors.redColor, size: 18),
              (w * 0.02).w,
              Expanded(
                child: Text(
                  AppString.onBoarding1SubText1,
                  style: AppTextStyle.semiBoldBlack14,
                ),
              ),
            ],
          ),
          (h * 0.02).h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.square, color: AppColors.blueLightColor, size: 18),
              (w * 0.02).w,
              Expanded(
                child: Text(
                  AppString.onBoarding1SubText2,
                  style: AppTextStyle.semiBoldBlack14,
                ),
              ),
            ],
          ),
          (h * 0.02).h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.square, color: AppColors.redColor, size: 18),
              (w * 0.02).w,
              Expanded(
                child: Text(
                  AppString.onBoarding1SubText3,
                  style: AppTextStyle.semiBoldBlack14,
                ),
              ),
            ],
          ),
          (h * 0.02).h,
        ],
      ),
    );
  }

  SingleChildScrollView secondPage(double h, double w) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Image.asset(AppAssets.manImg, width: w, fit: BoxFit.cover),
        ],
      ),
    );
  }

  SingleChildScrollView thirdPage(double h, double w) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.onBording3),
          (h * 0.04).h,
          Text(
            AppString.onBoarding3SubTextDescription1,
            style: AppTextStyle.semiBoldBlack14,
          ),
          (h * 0.02).h,
          Text(
            AppString.onBoarding3SubTextDescription2,
            style: AppTextStyle.semiBoldBlack14,
          ),
          (h * 0.03).h,
          Text(
            AppString.onBoarding3SubTextTitle,
            style: AppTextStyle.semiBoldBlack16,
          ),
          (h * 0.02).h,
          Row(
            children: [
              SizedBox(width: w * 0.13, height: 50),
              Expanded(
                child: Text(
                  AppString.onBoarding3SubTextDescription3,
                  style: AppTextStyle.semiBoldBlack14,
                ),
              ),
            ],
          ),
          (h * 0.03).h,
        ],
      ),
    );
  }
}
