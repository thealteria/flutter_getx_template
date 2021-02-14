import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomAppbarWidget extends PreferredSize {
  final String title;

  const CustomAppbarWidget({
    Key key,
    @required this.title,
  }) : super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 45.w,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: AppTextStyle.boldStyle(
          color: AppColors.mineShaft,
          fontSize: Dimens.fontSize18,
        ),
      ),
    );
  }
}
