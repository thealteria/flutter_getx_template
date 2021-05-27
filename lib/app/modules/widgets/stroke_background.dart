import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class StrokeBackground extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final double? height;

  const StrokeBackground({
    Key? key,
    required this.onTap,
    required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: 10.borderRadius,
      onTap: onTap,
      child: Container(
        height: height?.h,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: 10.borderRadius,
          border: Border.all(
            color: Colors.grey[200]!,
            width: 3.w,
          ),
        ),
        child: child,
      ),
    );
  }
}
