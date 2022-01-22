import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/utils.dart';

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

  static void get showLoadingDialog {
    _loadingDialog = _showLoadingDialog();
    Get.printInfo(info: 'start loading');
  }

  static void get closeLoadingDialog {
    Get.printInfo(info: 'close loading');
    _loadingDialog?.call();
  }
}
