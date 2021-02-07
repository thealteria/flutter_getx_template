import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/common/values/styles/dimens.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;

  PrimaryButton({
    this.onTap,
    this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      height: (height ?? 40).h,
      textColor: AppColors.kPrimaryColor,
      child: Text(
        text,
        style: AppTextStyle.buttonTextStyle(
          fontSize: Dimens.fontSize14,
        ),
      ),
    );
  }
}
