import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_start_project/app/common/util/utils.dart';
import 'package:getx_start_project/app/routes/app_pages.dart';

import 'errors/app_errors.dart';

mixin AppResponse {
  Either<AppErrors, T> getResponse<T>(Response<T> response) {
    HttpStatus status = response.status;

    if (status.connectionError) {
      return Left(NoConnectionError());
    }

    final res = jsonDecode(response.bodyString);

    if (!response.hasError && response.statusCode == 200) {
      return Right(response.body);
    } else {
      if (status.isServerError) {
        _showErrorDialog(TimeoutError());
        return Left(TimeoutError());
      } else if (response.unauthorized) {
        _showErrorDialog(
          UnauthorizeError(
            message: res['message']?.toString() ??
                'Unauthorize. Please login again!',
          ),
        );
        return Left(UnauthorizeError());
      } else {
        _showErrorDialog(ApiError());
        return Left(ApiError());
      }
    }
  }

  Future _showErrorDialog(AppErrors errors) {
    if (Get.isDialogOpen) {
      Get.back();
      return null;
    }

    return Utils.showDialog(
      errors.message,
      onTap: () => errors == UnauthorizeError()
          ? Get.offAllNamed(Routes.HOME)
          : Get.back(),
    );
  }
}
