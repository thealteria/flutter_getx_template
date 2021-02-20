import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/utils.dart';
import 'package:getx_start_project/app/routes/app_pages.dart';

import 'errors/app_errors.dart';

mixin AppResponse {
  Either<AppErrors, T> getResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.connectionError) {
      return Left(NoConnectionError());
    }

    try {
      final res = jsonDecode(response.bodyString);

      if (!response.hasError && response.statusCode == 200) {
        return Right(response.body);
      } else {
        if (status.isServerError) {
          return _leftError<T>(ApiError());
        } else if (response.unauthorized) {
          return _leftError(UnauthorizeError());
        } else {
          return _leftError<T>(
            ApiError(
              message: res['message']?.toString() ?? Strings.unknownError,
            ),
          );
        }
      }
    } on FormatException catch (e) {
      return _leftError<T>(ApiError(
        message: e?.toString() ?? Strings.unknownError,
      ));
    } on TimeoutException {
      return _leftError<T>(TimeoutError());
    }
  }

  Either<AppErrors, T> _leftError<T>(AppErrors errors) {
    Utils.closeDialog();

    Utils.showDialog(
      errors.message,
      onTap: errors != UnauthorizeError()
          ? null
          : () => Get.offAllNamed(Routes.HOME),
    );

    return Left(errors);
  }
}
