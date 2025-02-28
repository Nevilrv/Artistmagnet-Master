import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? bgColor;
  final String title;
  final TextStyle? textStyle;
  final Function() onTap;
  final double radius;
  final bool showBoxShadow;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.title,
    required this.isLoading,
    required this.onTap,
    this.radius = 5,
    this.width,
    this.showBoxShadow = false,
    this.textStyle,
    this.height,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
          boxShadow:
              showBoxShadow == true ? [BoxShadow(color: AppColors.greyColor2, offset: Offset(2, 2), blurRadius: 2, spreadRadius: 0)] : [],
          gradient: bgColor == null
              ? LinearGradient(
                  colors: [Color(0xFFaadeea), Color(0xFF33cbfe)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 50],
                )
              : null,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(height: 25, width: 25, child: CircularProgressIndicator(color: AppColors.whiteColor))
              : Text(
                  title,
                  style: textStyle ?? AppTextStyle.semiBoldBlack16.copyWith(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
