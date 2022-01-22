import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final Widget? leading;
  final Function()? onBackTap;
  final Color? backbuttonColor;

  const CustomBackButton({
    Key? key,
    this.leading,
    this.onBackTap,
    this.backbuttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBackTap ?? () => Get.back(),
      icon: leading ??
          Icon(
            Icons.arrow_back,
            color: backbuttonColor ?? Get.theme.primaryIconTheme.color,
          ).paddingOnly(left: 10.w),
    );
  }
}
