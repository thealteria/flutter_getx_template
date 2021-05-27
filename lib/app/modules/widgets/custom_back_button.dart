import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomBackButton extends StatelessWidget {
  final Widget? leading;
  final Function()? onBackTap;

  const CustomBackButton({
    Key? key,
    this.leading,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBackTap ?? () => Get.back(),
      icon: leading ??
          const Icon(
            Icons.arrow_back,
          ).paddingOnly(left: 10.w),
    );
  }
}
