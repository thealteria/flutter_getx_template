import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final double height, minWidth, cornerRadius;

  const CustomRaisedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.textStyle,
    this.height = 25,
    this.minWidth = 100,
    this.cornerRadius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height.h,
      minWidth: minWidth.w,
      shape: RoundedRectangleBorder(
        borderRadius: cornerRadius.borderRadius,
        side: BorderSide(
          color: AppColors.kPrimaryColor,
          width: 2.w,
        ),
      ),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        child: Text(
          title,
          style: textStyle ??
              AppTextStyle.boldStyle(
                fontSize: Dimens.fontSize14,
              ),
        ),
      ),
    );
  }
}
