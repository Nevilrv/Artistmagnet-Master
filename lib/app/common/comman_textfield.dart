import 'package:artistmagnet/app/common/app_textstyle.dart';
import 'package:artistmagnet/app/core/values/app_color.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final String titleText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obSecure;
  final String? Function(String?)? validation;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;
  final double radius;

  const LoginTextField(
      {super.key,
      this.keyboardType,
      this.labelText = "",
      this.titleText = "",
      this.controller,
      this.suffixIcon,
      this.obSecure,
      this.validation,
      this.labelStyle,
      this.focusNode,
      this.radius = 10});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obSecure ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validation,
      focusNode: focusNode,
      cursorColor: AppColors.blackColor,
      cursorOpacityAnimates: true,
      showCursor: true,
      cursorWidth: 1.5,
      style: AppTextStyle.boldBlack14,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          //hintText: hintText,
          labelText: labelText,
          labelStyle: labelStyle ?? AppTextStyle.regularBlack14.copyWith(color: AppColors.greyColor2),
          enabled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: AppColors.blackColor, width: 1.2)),
          // constraints: const BoxConstraints(maxWidth: 380),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: AppColors.blackColor, width: 5))),
    );
  }
}

class CommonTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? titleText;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obSecure;
  final String? Function(String?)? validation;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final double? radius;

  const CommonTextField(
      {super.key,
      this.keyboardType,
      this.labelText = "",
      this.titleText = "",
      this.controller,
      this.suffixIcon,
      this.obSecure,
      this.validation,
      this.labelStyle,
      this.focusNode,
      this.radius = 0,
      this.hintText = "",
      this.hintStyle,
      this.width});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        height: h * 0.050,
        width: width ?? double.infinity,
        child: TextFormField(
          style: AppTextStyle.regularBlack12,
          cursorColor: AppColors.blackColor,
          cursorWidth: 1,
          decoration: InputDecoration(
              hintStyle: AppTextStyle.regularBlack12,
              hintText: hintText,
              filled: true,
              fillColor: AppColors.lightGrey,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(0)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(0))),
        ));
  }
}
