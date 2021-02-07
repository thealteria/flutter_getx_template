import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static TextStyle heading1Style({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize26,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: decoration,
    );
  }

  static TextStyle heading2Style({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize20,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: decoration,
    );
  }

  static TextStyle mediumStyle({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color.withOpacity(0.75),
      fontSize: fontSize ?? Dimens.fontSize14,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: decoration,
    );
  }

  static TextStyle semiBoldStyle({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize14,
      fontWeight: fontWeight ?? FontWeight.w600,
      decoration: decoration,
    );
  }

  static TextStyle boldStyle({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize22,
      fontWeight: fontWeight ?? FontWeight.w700,
      decoration: decoration,
    );
  }

  static TextStyle regularStyle({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize12,
      decoration: decoration,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle buttonTextStyle({
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return _textStyle(
      color: color,
      fontSize: fontSize ?? Dimens.fontSize16,
      fontWeight: fontWeight ?? FontWeight.w400,
      decoration: decoration,
    );
  }

  static TextStyle _textStyle({
    Color color,
    @required double fontSize,
    FontWeight fontWeight,
    TextDecoration decoration,
  }) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.kPrimaryColor,
      fontSize: fontSize ?? Dimens.fontSize14,
      decoration: decoration,
      fontWeight: fontWeight,
    );
  }
}
