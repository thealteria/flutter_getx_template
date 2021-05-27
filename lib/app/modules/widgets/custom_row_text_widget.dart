import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomRowTextWidget extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRowTextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          maxLines: 1,
          style: titleStyle ??
              AppTextStyle.regularStyle.copyWith(
                color: AppColors.mineShaft,
              ),
        ),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle ??
              AppTextStyle.regularStyle.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
