import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_template/app/data/errors/api_error.dart';
import 'package:get/get.dart';

class ApiInterfaceController extends GetxController {
  ApiError? error;

  VoidCallback? retry;

  void onRetryTap() {
    error = null;
    retry?.call();
    update();
  }
}
