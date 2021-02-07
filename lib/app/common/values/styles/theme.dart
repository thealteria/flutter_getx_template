import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_start_project/app/common/util/extensions.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/common/values/styles/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final themeData = ThemeData.light();
    final textTheme = themeData.textTheme;

    final bodyText2 = textTheme.bodyText2.copyWith(
      color: AppColors.kPrimaryColor,
      fontSize: Dimens.fontSize18,
      fontWeight: FontWeight.w700,
    );

    return ThemeData(
      fontFamily: GoogleFonts.nunito().fontFamily,
      brightness: Brightness.light,
      primaryColor: AppColors.kPrimaryColor,
      accentColor: AppColors.kPrimaryColor,
      buttonColor: AppColors.kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: AppColors.kPrimaryColor,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.kPrimaryColor,
        height: 45.h,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: 23.borderRadius,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      primaryTextTheme: textTheme.copyWith(
        bodyText2: bodyText2,
      ),
      textTheme: TextTheme(
        subtitle1: AppTextStyle.regularStyle(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixStyle: AppTextStyle.regularStyle(),
        hintStyle: AppTextStyle.regularStyle(
          color: Colors.grey[700],
          fontSize: Dimens.fontSize13,
        ),
        labelStyle: AppTextStyle.regularStyle(
          fontSize: Dimens.fontSize16,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: 30.borderRadius,
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: 30.borderRadius,
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: 30.borderRadius,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: 14.borderRadius,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }
}
