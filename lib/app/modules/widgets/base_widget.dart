import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/app/modules/widgets/custom_retry_widget.dart';

export 'package:getx_start_project/app/common/util/exports.dart';

class BaseWidget extends GetView<ApiInterfaceController> {
  ///A widget with only custom retry button widget.

  final Widget child;
  final bool addSafeArea, addBackgroundColor;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  const BaseWidget({
    Key? key,
    required this.child,
    this.addSafeArea = true,
    this.addBackgroundColor = true,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.retry != null
          ? safeAreaWidget
          : (addSafeArea ? SafeArea(child: widget) : widget),
    );
  }

  Widget get safeAreaWidget => SafeArea(
        child: controller.error != null
            ? CustomRetryWidget(
                onPressed: () {
                  controller.error = null;

                  controller.retry!();
                },
              )
            : widget,
      );

  Widget get widget => Container(
        width: double.infinity,
        color: addBackgroundColor ? AppColors.white : backgroundColor,
        padding: padding,
        child: child,
      );
}
