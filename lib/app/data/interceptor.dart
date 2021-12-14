import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_start_project/app/common/values/strings.dart';

import 'api_helper.dart';
import 'errors/api_error.dart';

FutureOr interceptor(
  GetHttpClient httpClient,
  Request request,
  Response response,
) {
  Utils.closeDialog();

  Get.printInfo(
    info: 'Status Code: ${response.statusCode}\n'
        'Data: ${response.bodyString?.toString() ?? ''}',
  );

  final status = response.status;

  if (status.connectionError) {
    showError(ApiError(
      type: ErrorType.noConnection,
      error: Strings.noConnection,
    ));
  }

  try {
    final res = jsonDecode(response.bodyString!);

    if (response.isOk) {
      if (res is Map &&
          res['status'] != null &&
          ((res['status'] is bool && !res['status']) ||
              res['status'] is String && res['status'] != 'OK')) {
        if (res['error_message'] != null &&
            res['error_message'].toString().isNotEmpty) {
          showError(ApiError(
            type: ErrorType.response,
            error: res['error_message']?.toString() ?? Strings.unknownError,
          ));
        } else {
          showError(ApiError(
            type: ErrorType.response,
            error: res['message']?.toString() ?? Strings.unknownError,
          ));
        }
      }

      return response;
    } else {
      if (status.isServerError) {
        showError(ApiError());
      } else if (status.code == HttpStatus.requestTimeout) {
        showError(ApiError(
          type: ErrorType.connectTimeout,
          error: Strings.connectionTimeout,
        ));
      } else if (response.unauthorized) {
        showError(ApiError(
          type: ErrorType.unauthorize,
          error: res['message']?.toString() ?? Strings.unauthorize,
        ));
      } else {
        showError(ApiError(
          type: ErrorType.response,
          error: res['message']?.toString() ?? Strings.unknownError,
        ));
      }
    }
  } on FormatException {
    showError(ApiError(
      type: ErrorType.unknownError,
      error: Strings.unknownError,
    ));
  } on TimeoutException catch (e) {
    showError(ApiError(
      type: ErrorType.connectTimeout,
      error: e.message?.toString() ?? Strings.connectionTimeout,
    ));
  }
}

FutureOr showError(ApiError error) {
  return Future.error(error);
}
