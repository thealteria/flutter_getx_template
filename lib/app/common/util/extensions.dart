import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/storage/storage.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/main.dart';

import 'utils.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(this.r);
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (this.length == 6 || this.length == 7) buffer.write('ff');

    if (this.startsWith('#')) buffer.write(this.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StorageExt on String {
  void saveValue({
    @required String key,
  }) =>
      Storage.saveValue(key, this);
  //this -> value to be saved

  T getValue<T>() => Storage.getValue<T>(this);
  //this -> key to get

  void removeValue() => Storage.removeValue(this);
  //this -> key to get
}

extension FutureExt<T> on Future<Either<AppErrors, T>> {
  void futureValue(
    Function(T value) response, {
    Function(String error) onError,
    @required VoidCallback retryFunction,
  }) {
    ApiInterfaceController _interface = Get.find<ApiInterfaceController>();
    _interface.error = null;

    Utils.loadingDialog;

    this.then((value) {
      value.fold(
        (l) {
          if (onError != null) onError(l.message);

          print('Runtime: ${l.runtimeType}');

          if (l is NoConnectionError) {
            _interface.error = l;

            if (retryFunction != null) _interface.retry = retryFunction;
          }

          logger.e('Left: ${l.message}');
        },
        (r) {
          response(r);
        },
      );
    }).catchError((e) {
      if (onError != null) onError(e.toString());
      if (e != null) logger.e('catchError: ${e.toString()}');
    }).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        Utils.closeDialog();
      },
    ).whenComplete(
      Utils.closeDialog,
    );
  }
}

extension DebugLog on String {
  void debugLog() {
    return debugPrint(
      '\n******************************* DebugLog *******************************\n'
      ' $this'
      '\n******************************* DebugLog *******************************\n',
      wrapWidth: 1024,
    );
  }
}
