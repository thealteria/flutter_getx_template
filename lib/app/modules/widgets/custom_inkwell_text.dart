import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';

class CustomInkwellText extends StatelessWidget {
  const CustomInkwellText({
    Key key,
    @required this.onTap,
    @required this.title,
    this.textStyle,
    this.textColor,
    this.textSize,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        assert(
          textSize == null || textStyle == null,
          'Cannot provide both a textSize and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(size: textSize)".',
        ),
        super(key: key);

  final Function onTap;
  final String title;
  final TextStyle textStyle;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: textStyle ??
            AppTextStyle.regularStyle().copyWith(
              color: textColor,
              fontSize: textSize,
            ),
      ).paddingAll(8),
    );
  }
}
