import 'package:flutter_getx_template/app/common/util/utils.dart';
import 'package:get/get.dart';

typedef CloseDialog = void Function();

class LoadingDialog {
  static CloseDialog? _loadingDialog;

  static const LoadingDialog _instance = LoadingDialog._internal();
  factory LoadingDialog() {
    return _instance;
  }
  const LoadingDialog._internal();

  static CloseDialog _showLoadingDialog() {
    Get.printInfo(info: 'initialized loading');
    Utils.loadingDialog();
    return Utils.closeDialog;
  }

  static void showLoadingDialog() {
    _loadingDialog = _showLoadingDialog();
    Get.printInfo(info: 'start loading');
  }

  static void closeLoadingDialog() {
    Get.printInfo(info: 'close loading');
    _loadingDialog?.call();
  }
}
