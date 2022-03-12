import 'dart:async';
import 'dart:convert';

import 'package:flutter_getx_template/app/common/values/strings.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'errors/api_error.dart';

abstract class ApiResponse {
  static T? getResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.connectionError) {
      throw const ApiError(
        type: ErrorType.noConnection,
        error: Strings.noConnection,
      );
    }

    if (response.bodyString == null) throw const ApiError();

    try {
      String result = response.bodyString!;
      final res = jsonDecode(result);

      if (response.isOk) {
        if (res is Map) {
          if (res['errorcode'] != null &&
              res['errorcode'].toString().isNotEmpty) {
            if (res['errorcode'].toString() == 'invalidtoken') {
              throw const ApiError(
                type: ErrorType.response,
                error: Strings.unauthorize,
              );
            } else {
              throw ApiError(
                type: ErrorType.response,
                error: res['msg']?.toString() ??
                    (res['message']?.toString() ?? Strings.unknownError),
              );
            }
          }
        }

        return response.body;
      } else {
        if (status.isServerError) {
          throw const ApiError();
        } else if (status.code == HttpStatus.requestTimeout) {
          throw const ApiError(
            type: ErrorType.connectTimeout,
            error: Strings.connectionTimeout,
          );
        } else if (response.unauthorized) {
          throw ApiError(
            type: ErrorType.unauthorize,
            error: res['msg']?.toString() ?? Strings.unauthorize,
          );
        } else {
          throw ApiError(
            type: ErrorType.response,
            error: res['msg']?.toString() ?? Strings.unknownError,
          );
        }
      }
    } on FormatException {
      throw const ApiError(
        type: ErrorType.unknownError,
        error: Strings.unknownError,
      );
    } on TimeoutException catch (e) {
      throw ApiError(
        type: ErrorType.connectTimeout,
        error: e.message?.toString() ?? Strings.connectionTimeout,
      );
    }
  }
}
