import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/app/modules/widgets/custom_retry_widget.dart';

class BaseWidget extends GetView<ApiInterfaceController> {
  final Widget child;

  const BaseWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BaseWidget build');
    return Obx(
      () => SafeArea(
        child: controller.error != null
            ? CustomRetryWidget(
                onPressed: () {
                  controller.error = null;
                  if (controller.retry != null) controller.retry();
                },
              )
            : child,
      ),
    );
  }
}
