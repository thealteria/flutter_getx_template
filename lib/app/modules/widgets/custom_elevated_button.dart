import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double height, minWidth;
  final Widget? titleWidget;
  final Color buttonColor;
  final bool addBorder;

  const CustomElevatedButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.height = 52,
    this.minWidth = 100,
    this.buttonColor = AppColors.kPrimaryColor,
    this.titleWidget,
    this.addBorder = false,
  })  : assert(
          title == null || titleWidget == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "titleWidget: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => Size(
            minWidth.w,
            height.h,
          ),
        ),
        shape: addBorder
            ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: 10.borderRadius,
                  side: BorderSide(
                    color: buttonColor == AppColors.kPrimaryColor
                        ? Colors.white
                        : AppColors.kPrimaryColor,
                    width: 2.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColors.kPrimaryColor.withOpacity(.24)
                  : Colors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.doveGray;
            }
            return buttonColor;
          },
        ),
      ),
      child: titleWidget ??
          Text(
            title!,
            style: textStyle ??
                AppTextStyle.boldStyle.copyWith(
                  fontSize: Dimens.fontSize14,
                  color: buttonColor == Colors.white ||
                          buttonColor == Colors.transparent
                      ? AppColors.kPrimaryColor
                      : Colors.white,
                ),
          ),
    );
  }
}
