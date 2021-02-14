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
      scaffoldBackgroundColor: AppColors.kPrimaryColor,
      fontFamily: GoogleFonts.nunito().fontFamily,
      brightness: Brightness.light,
      primaryColor: AppColors.kPrimaryColor,
      accentColor: AppColors.kPrimaryColor,
      buttonColor: AppColors.kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      primaryTextTheme: textTheme.copyWith(
        bodyText2: bodyText2,
      ),
      textTheme: TextTheme(
        subtitle1: AppTextStyle.regularStyle(
          color: Colors.black,
          fontSize: Dimens.fontSize14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        prefixStyle: AppTextStyle.regularStyle(
          fontSize: Dimens.fontSize14,
          color: Colors.black,
        ),
        hintStyle: AppTextStyle.regularStyle(
          color: Colors.grey[700],
          fontSize: Dimens.fontSize14,
        ),
        enabledBorder: 30.outlineInputBorder(),
        disabledBorder: 30.outlineInputBorder(),
        focusedBorder: 30.outlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        border: 30.outlineInputBorder(),
      ),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              23.r,
            ),
            topRight: Radius.circular(
              23.r,
            ),
          ),
        ),
      ),
    );
  }
}
