import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF33cbfe);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color redColor = Color(0xffcc3333);
  static const Color orangeColor = Colors.orange;
  static const Color greyColor = Colors.grey;
  static const Color blueColor = Colors.blueAccent;
  static const Color transparentColor = Colors.transparent;
  static const Color blueLightColor = Color(0xffaadeea);
  static const Color secondaryColor = Color(0xff0076a3);
  static const Color greyColor2 = Color(0xff808080);
  static const Color lightGrey = Color(0xffebebeb);
  static const Color yellowColor = Color(0xffffc439);

  static Gradient redColorGradient = LinearGradient(
    colors: [Colors.red.shade500, Colors.red.shade700, Colors.red.shade800, Colors.red.shade900],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
