import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/storage/storage.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/main.dart';
import 'package:intl/intl.dart';

import 'utils.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(this.r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: this.borderRadius,
        borderSide: borderSide,
      );
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

extension ImageExt on String {
  String get image => 'assets/images/$this.png';

  Image imageAsset({
    Size size,
    BoxFit fit,
  }) =>
      Image.asset(
        this,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

extension FutureExt<T> on Future<Either<AppErrors, T>> {
  void futureValue(
    Function(T value) response, {
    Function(String error) onError,
    @required VoidCallback retryFunction,
  }) {
    final _interface = Get.find<ApiInterfaceController>();
    _interface.error = null;

    Utils.loadingDialog();

    this.then((value) {
      value.fold(
        (l) {
          if (onError != null) {
            onError(l.message);
          }

          if (l is NoConnectionError) {
            _interface.error = l;

            if (retryFunction != null) {
              _interface.retry = retryFunction;
            }
          }

          logger.e('Left: ${l.message}');
        },
        (r) {
          response(r);
        },
      );
    }).catchError((e) {
      if (onError != null) {
        onError(e.toString());
      }
      if (e != null) {
        logger.e('catchError: ${e.toString()}');
      }
    }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        Utils.closeDialog();
      },
    ).whenComplete(
      Utils.closeDialog,
    );
  }
}

extension DateTimeFormatterExt on DateTime {
  String formatedDate({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    final formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }
}

extension FormatDurationExt on int {
  String formatDuration() {
    final min = this ~/ 60;
    final sec = this % 60;
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} min";
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
