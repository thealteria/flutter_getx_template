import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_start_project/app/common/util/extensions.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/common/values/styles/dimens.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme {
    final inputBorder = 16.outlineInputBorder(
      borderSide: 3.borderSide(),
    );

    final hintStyle = AppTextStyle.semiBoldStyle.copyWith(
      color: AppColors.doveGray,
      fontSize: Dimens.fontSize14,
    );

    return ThemeData(
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
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(.14);
              }

              return null;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.doveGray;
              }
              return null;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white.withOpacity(.14);
              }

              return null;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      textTheme: TextTheme(
        subtitle1: AppTextStyle.regularStyle.copyWith(
          color: AppColors.mineShaft,
          fontSize: Dimens.fontSize14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        prefixStyle: AppTextStyle.regularStyle.copyWith(
          fontSize: Dimens.fontSize14,
          color: AppColors.black,
        ),
        hintStyle: hintStyle,
        labelStyle: hintStyle,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
      ),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: 20.borderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r),
          ),
        ),
      ),
    );
  }
}
