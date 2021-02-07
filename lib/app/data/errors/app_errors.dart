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
    this.message = 'Unknow error! Please try again after some time.',
  });
}

class TimeoutError extends AppErrors {
  @override
  final String message;

  TimeoutError({
    this.message = 'Connection timeout. Please try again after some time.',
  });
}

class NoConnectionError extends AppErrors {
  @override
  final String message;

  NoConnectionError({
    this.message = 'No connection. Please turn on your internet!',
  });
}

class UnauthorizeError extends AppErrors {
  @override
  final String message;

  UnauthorizeError({
    this.message = 'Unauthorize. Please login again!',
  });
}
