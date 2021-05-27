import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final TextAlign textAlign;

  const CustomRichTextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: title,
        style: titleStyle ??
            AppTextStyle.regularStyle.copyWith(
              color: AppColors.mineShaft,
              fontSize: Dimens.fontSize14,
            ),
        children: [
          TextSpan(
            text: ' $subtitle',
            style: subtitleStyle ??
                AppTextStyle.regularStyle.copyWith(
                  fontSize: Dimens.fontSize14,
                ),
          ),
        ],
      ),
    );
  }
}
