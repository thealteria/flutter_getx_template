import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';

class ApiInterfaceController extends GetxController {
  final Rx<AppErrors?> _error = Rx<AppErrors?>(null);
  AppErrors? get error => _error.value;
  set error(AppErrors? errors) => this._error.value = errors;

  final Rx<VoidCallback?> _retry = Rx<VoidCallback?>(null);
  VoidCallback? get retry => this._retry.value;
  set retry(VoidCallback? retry) => this._retry.value = retry;

}
