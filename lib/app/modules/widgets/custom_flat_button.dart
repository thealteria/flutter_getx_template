import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/common/values/styles/dimens.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height, buttonWidth;
  final Widget child;
  final Color buttonColor;

  const CustomFlatButton({
    Key key,
    @required this.onPressed,
    this.title,
    this.height = 45,
    this.child,
    this.buttonColor = AppColors.kPrimaryColor,
    this.buttonWidth,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: buttonWidth,
      onPressed: onPressed,
      color: buttonColor ?? AppColors.kPrimaryColor,
      height: height.h,
      splashColor: buttonColor == AppColors.kPrimaryColor
          ? Colors.white24
          : AppColors.kPrimaryColor.withOpacity(0.24),
      child: child ??
          Text(
            title,
            style: AppTextStyle.buttonTextStyle().copyWith(
              fontSize: Dimens.fontSize14,
              color: Colors.white,
            ),
          ),
    );
  }
}
