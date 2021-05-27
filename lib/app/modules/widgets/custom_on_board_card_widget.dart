import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomOnBoardCardWidget extends StatelessWidget {
  final String title, subtitle;
  final double? titleTextSize, subtitleTextSize;
  final List<Widget> children;

  const CustomOnBoardCardWidget({
    Key? key,
    required this.children,
    required this.title,
    required this.subtitle,
    this.titleTextSize,
    this.subtitleTextSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: 10.borderRadius,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: AppTextStyle.semiBoldStyle.copyWith(
                  color: Colors.black,
                  fontSize: titleTextSize ?? Dimens.fontSize28,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                subtitle,
                style: AppTextStyle.regularStyle.copyWith(
                  color: AppColors.mineShaft.withOpacity(0.65),
                  fontSize: subtitleTextSize ?? Dimens.fontSize16,
                ),
              ),
              SizedBox(height: 22.h),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
