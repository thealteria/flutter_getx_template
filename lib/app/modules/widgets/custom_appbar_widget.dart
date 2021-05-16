import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomAppbarWidget extends PreferredSize {
  final String title;
  final Color backgroundColor, backbuttonColor, textColor;
  final TextStyle textStyle;
  final List<Widget> actions;

  const CustomAppbarWidget({
    Key key,
    @required this.title,
    this.backgroundColor = Colors.white,
    this.backbuttonColor = Colors.black,
    this.textColor = AppColors.mineShaft,
    this.textStyle,
    this.actions,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: actions,
      actionsIconTheme: IconThemeData(
        size: 30.w,
      ),
      leadingWidth: 45.w,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: textStyle ??
            AppTextStyle.boldStyle().copyWith(
              color: textColor,
              fontSize: Dimens.fontSize18,
            ),
      ),
    );
  }
}
