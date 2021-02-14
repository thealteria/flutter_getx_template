import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/values/app_colors.dart';

class CustomInkwellWidget extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const CustomInkwellWidget({
    Key key,
    @required this.onTap,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.kPrimaryColor.withOpacity(0.24),
        child: child.paddingAll(8),
      ),
    );
  }
}
