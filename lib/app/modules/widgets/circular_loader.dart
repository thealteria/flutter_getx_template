import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
      ),
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
