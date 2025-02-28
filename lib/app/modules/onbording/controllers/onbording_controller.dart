import 'package:artistmagnet/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class OnboardingController extends GetxController {
  late VideoPlayerController videoPlayerController;
  var isVideoInitialized = false.obs;
  var selectedIndex = 0.obs;
  final PageController pageController = PageController(viewportFraction: 1);
  @override
  void onInit() {
    super.onInit();
    initializeVideo();
  }

  void initializeVideo() async {
    try {
      videoPlayerController = VideoPlayerController.asset('assets/images/banner_video.mp4')
        ..initialize().then((_) {
          isVideoInitialized.value = true;
          videoPlayerController.play();
        })
        ..setLooping(true);
    } catch (e) {
      debugPrint('e==========initializeVideo====>>>$e');
    }
  }

  void pauseVideo() {
    videoPlayerController.pause();
  }

  void resumeVideo() {
    videoPlayerController.play();
  }

  void changeIndex(int index) {
    if (index == 0) {
      resumeVideo();
    } else {
      pauseVideo();
    }
    selectedIndex.value = index;
    update();
  }

  void onTapSkipButton() {
    Get.offAllNamed(Routes.LOGIN);
  }

  void onTapNextButton() {
    if (selectedIndex.value == 2) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      changeIndex(selectedIndex.value + 1);
    }

    pageController.animateToPage(selectedIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
