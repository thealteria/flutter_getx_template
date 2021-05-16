import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/constants.dart';
import 'package:getx_start_project/app/common/storage/storage.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
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

  BorderSide borderSide({
    Color color,
    double width,
    BorderStyle style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: this.toDouble(),
        style: style ?? BorderStyle.solid,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (this.length == 6 || this.length == 7) {
      buffer.write('ff');
    }

    if (this.startsWith('#')) {
      buffer.write(this.replaceFirst('#', ''));
    }
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

extension DateTimeFormatterExt on DateTime {
  String formatedDate({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    final formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }
}

extension TimeOfDayExt on String {
  TimeOfDay getTimeOfDay({
    int addMinutes = 0,
  }) =>
      TimeOfDay.fromDateTime(
        DateFormat.jm().parse(this).add(
              Duration(
                minutes: addMinutes,
              ),
            ),
      );
}

extension ImageExt on String {
  String get image => 'assets/images/$this.png';

  Image imageAsset({
    Size size,
    BoxFit fit,
    Color color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

extension FutureExt<T> on Future<Either<AppErrors, T>> {
  void futureValue(
    Function(T value) response, {
    Function(String error) onError,
    VoidCallback retryFunction,
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
            Utils.closeDialog();

            _interface.error = l;

            if (retryFunction != null) {
              _interface.retry = retryFunction;
            }
          }

          printError(info: 'Left: ${l.message}');
        },
        (r) {
          Utils.closeDialog();
          response(r);
        },
      );
    }).catchError((e) {
      Utils.closeDialog();

      if (onError != null) {
        onError(e.toString());
      }
      if (e != null) {
        printError(info: 'catchError: ${e.toString()}');

        if (e is NoConnectionError || e is TimeoutError) {
          Utils.showSnackbar(e.message);
        }
      }

      if (onError != null) {
        onError(e.toString());
      }
    }).timeout(
      Constants.TIMEOUT,
      onTimeout: () {
        Utils.closeDialog();

        Utils.showSnackbar(TimeoutError().message);

        if (retryFunction != null) {
          _interface.retry = retryFunction;
        }
      },
    );
  }
}

extension AlignWidgetExt on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );
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
