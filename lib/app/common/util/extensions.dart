import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/constants.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/data/app_reponse.dart';
import 'package:getx_start_project/app/data/errors/app_errors.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';
import 'package:getx_start_project/app/routes/app_pages.dart';
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
    Color? color,
    double? width,
    BorderStyle? style,
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
    Size? size,
    BoxFit? fit,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

extension FutureExt<T> on Future<Response<T>?> {
  void futureValue(
    Function(T value) response, {
    Function(String? error)? onError,
    VoidCallback? retryFunction,
  }) {
    final _interface = Get.find<ApiInterfaceController>();
    _interface.error = null;

    Utils.loadingDialog();

    this.timeout(
      Constants.timeout,
      onTimeout: () {
        Utils.closeDialog();
        Utils.showSnackbar(TimeoutError().message);
        if (retryFunction != null) {
          _interface.retry = retryFunction;
        }

        throw TimeoutError();
      },
    ).then((value) {
      Utils.closeDialog();

      final result = AppResponse.getResponse(value!);
      response(result!);
    }).catchError((e) {
      final isAppError = e is AppErrors;
      final String errorMessage = isAppError ? e.message : e.toString();

      Utils.closeDialog();

      Utils.showDialog(
        errorMessage,
        onTap: errorMessage != UnauthorizeError().message
            ? null
            : () {
                Storage.clearStorage();
                Get.offAllNamed(
                  Routes.HOME,
                  //change the ROUTE to the LOGIN or SPLASH screen so that the
                  //user can login again on UnauthorizeError error
                );
              },
      );

      if (onError != null) {
        onError(errorMessage);
      }

      if (e is NoConnectionError || e is TimeoutError) {
        _interface.error = e;

        if (retryFunction != null) {
          _interface.retry = retryFunction;
        }
      }

      printError(info: 'catchError: error: $e\nerrorMessage: $errorMessage');
    });
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
