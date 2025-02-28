import 'package:artistmagnet/app/core/values/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logoHero',
          child: Image.asset(
            AppAssets.logoImage,
            width: 300,
          ),
        ),
      ),
    );
  }
}
