import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/main.dart';

abstract class AppErrors implements Exception {
  String get message;

  AppErrors() {
    logger.e(message);
  }
}

class ApiError extends AppErrors {
  @override
  final String message;

  ApiError({
    this.message = Strings.unknownError,
  });
}

class TimeoutError extends AppErrors {
  @override
  final String message;

  TimeoutError({
    this.message = Strings.connectionTimeout,
  });
}

class NoConnectionError extends AppErrors {
  @override
  final String message;

  NoConnectionError({
    this.message = Strings.noConnection,
  });
}

class UnauthorizeError extends AppErrors {
  @override
  final String message;

  UnauthorizeError({
    this.message = Strings.unauthorize,
  });
}
