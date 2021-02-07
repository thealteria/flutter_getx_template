import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';

class ApiInterfaceController extends GetxController {
  Rx<AppErrors> _error = Rx<AppErrors>();
  Rx<Function> _retry = Rx<VoidCallback>();

  VoidCallback get retry => this._retry.value;

  set retry(VoidCallback retry) => this._retry.value = retry;

  AppErrors get error => _error.value;

  set error(AppErrors errors) => this._error.value = errors;
}
