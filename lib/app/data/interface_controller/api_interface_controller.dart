import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';

class ApiInterfaceController extends GetxController {
  AppErrors? error;

  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
