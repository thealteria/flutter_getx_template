import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:getx_start_project/app/common/storage/storage.dart';
import 'package:getx_start_project/app/common/values/strings.dart';
import 'package:getx_start_project/app/routes/app_pages.dart';

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
      httpClient.close();

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
    httpClient.close();

    showError(ApiError(
      type: ErrorType.unknownError,
      error: Strings.unknownError,
    ));
  } on TimeoutException catch (e) {
    httpClient.close();

    showError(ApiError(
      type: ErrorType.connectTimeout,
      error: e.message?.toString() ?? Strings.connectionTimeout,
    ));
  }
}

void showError(ApiError error) {
  Utils.showDialog(
    error.message,
    onTap: error.message != Strings.unauthorize
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

  throw error;
}



// import 'dart:async';
// import 'dart:collection';

// import 'package:get/get_connect.dart';

// import 'errors/app_errors.dart';

// typedef EnqueueCallback = FutureOr Function();

// /// Add lock/unlock API for interceptors.
// class Lock {
//   Future? _lock;

//   late Completer _completer;

//   /// Whether this interceptor has been locked.
//   bool get locked => _lock != null;

//   /// Lock the interceptor.
//   ///
//   /// Once the request/response interceptor is locked, the incoming request/response
//   /// will be added to a queue  before they enter the interceptor, they will not be
//   /// continued until the interceptor is unlocked.
//   void lock() {
//     if (!locked) {
//       _completer = Completer();
//       _lock = _completer.future;
//     }
//   }

//   /// Unlock the interceptor. please refer to [lock()]
//   void unlock() {
//     if (locked) {
//       _completer.complete();
//       _lock = null;
//     }
//   }

//   /// Clean the interceptor queue.
//   void clear([String msg = 'cancelled']) {
//     if (locked) {
//       _completer.completeError(msg);
//       _lock = null;
//     }
//   }

//   /// If the interceptor is locked, the incoming request/response task
//   /// will enter a queue.
//   ///
//   /// [callback] the function  will return a `Future`
//   /// @nodoc
//   Future? enqueue(EnqueueCallback callback) {
//     if (locked) {
//       // we use a future as a queue
//       return _lock!.then((d) => callback());
//     }
//     return null;
//   }
// }

// /// Internal enum
// /// @nodoc
// enum InterceptorResultType {
//   next,
//   resolve,
//   resolveCallFollowing,
//   reject,
//   rejectCallFollowing,
// }

// /// Internal class, It is used to pass state between current and next interceptors.
// /// @nodoc
// class InterceptorState<T> {
//   InterceptorState(this.data, [this.type = InterceptorResultType.next]);

//   T data;
//   InterceptorResultType type;
// }

// class _BaseHandler {
//   final _completer = Completer<InterceptorState>();

//   Future<InterceptorState> get future => _completer.future;

//   bool get isCompleted => _completer.isCompleted;
// }

// /// Handler for request interceptor.
// class RequestInterceptorHandler extends _BaseHandler {
//   /// Continue to call the next request interceptor.
//   void next() {
//     _completer.complete(InterceptorState());
//   }

//   /// Return the response directly! Other request interceptor(s) will not be executed,
//   /// but response and error interceptor(s) may be executed, which depends on whether
//   /// the value of parameter [callFollowingResponseInterceptor] is true.
//   ///
//   /// [response]: Response object to return.
//   /// [callFollowingResponseInterceptor]: Whether to call the response interceptor(s).
//   void resolve(Response response,
//       [bool callFollowingResponseInterceptor = false]) {
//     _completer.complete(
//       InterceptorState<Response>(
//         response,
//         callFollowingResponseInterceptor
//             ? InterceptorResultType.resolveCallFollowing
//             : InterceptorResultType.resolve,
//       ),
//     );
//   }

//   /// Complete the request with an error! Other request/response interceptor(s) will not
//   /// be executed, but error interceptor(s) may be executed, which depends on whether the
//   /// value of parameter [callFollowingErrorInterceptor] is true.
//   ///
//   /// [error]: Error info to reject.
//   /// [callFollowingErrorInterceptor]: Whether to call the error interceptor(s).
//   void reject(ApiError error, [bool callFollowingErrorInterceptor = false]) {
//     _completer.completeError(
//       InterceptorState<ApiError>(
//         error,
//         callFollowingErrorInterceptor
//             ? InterceptorResultType.rejectCallFollowing
//             : InterceptorResultType.reject,
//       ),
//     );
//   }
// }

// /// Handler for response interceptor.
// class ResponseInterceptorHandler extends _BaseHandler {
//   /// Continue to call the next response interceptor.
//   void next(Response response) {
//     _completer.complete(
//       InterceptorState<Response>(response),
//     );
//   }

//   /// Return the response directly! Other response interceptor(s) will not be executed.
//   /// [response]: Response object to return.
//   void resolve(Response response) {
//     _completer.complete(
//       InterceptorState<Response>(
//         response,
//         InterceptorResultType.resolve,
//       ),
//     );
//   }

//   /// Complete the request with an error! Other response interceptor(s) will not
//   /// be executed, but error interceptor(s) may be executed, which depends on whether the
//   /// value of parameter [callFollowingErrorInterceptor] is true.
//   ///
//   /// [error]: Error info to reject.
//   /// [callFollowingErrorInterceptor]: Whether to call the error interceptor(s).
//   void reject(ApiError error, [bool callFollowingErrorInterceptor = false]) {
//     _completer.completeError(
//       InterceptorState<ApiError>(
//         error,
//         callFollowingErrorInterceptor
//             ? InterceptorResultType.rejectCallFollowing
//             : InterceptorResultType.reject,
//       ),
//     );
//   }
// }

// /// Handler for error interceptor.
// class ErrorInterceptorHandler extends _BaseHandler {
//   /// Continue to call the next error interceptor.
//   void next(ApiError err) {
//     _completer.completeError(
//       InterceptorState<ApiError>(err),
//     );
//   }

//   /// Complete the request with Response object and other error interceptor(s) will not be executed.
//   /// This will be considered a successful request!
//   ///
//   /// [response]: Response object to return.
//   void resolve(Response response) {
//     _completer.complete(InterceptorState<Response>(
//       response,
//       InterceptorResultType.resolve,
//     ));
//   }

//   /// Complete the request with a error directly! Other error interceptor(s) will not be executed.
//   void reject(ApiError error) {
//     _completer.completeError(
//       InterceptorState<ApiError>(
//         error,
//         InterceptorResultType.reject,
//       ),
//     );
//   }
// }

// ///  Dio instance may have interceptor(s) by which you can intercept
// ///  requests/responses/errors before they are handled by `then` or `catchError`.
// class Interceptor {
//   /// The callback will be executed before the request is initiated.
//   ///
//   /// If you want to continue the request, call [handler.next].
//   ///
//   /// If you want to complete the request with some custom data，
//   /// you can resolve a [Response] object with [handler.resolve].
//   ///
//   /// If you want to complete the request with an error message,
//   /// you can reject a [ApiError] object with [handler.reject].
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) =>
//       handler.next(options);

//   /// The callback will be executed on success.
//   /// If you want to continue the response, call [handler.next].
//   ///
//   /// If you want to complete the response with some custom data directly,
//   /// you can resolve a [Response] object with [handler.resolve] and other
//   /// response interceptor(s) will not be executed.
//   ///
//   /// If you want to complete the response with an error message,
//   /// you can reject a [ApiError] object with [handler.reject].
//   void onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) =>
//       handler.next(response);

//   /// The callback will be executed on error.
//   ///
//   /// If you want to continue the error , call [handler.next].
//   ///
//   /// If you want to complete the response with some custom data directly,
//   /// you can resolve a [Response] object with [handler.resolve] and other
//   /// error interceptor(s) will be skipped.
//   ///
//   /// If you want to complete the response with an error message directly,
//   /// you can reject a [ApiError] object with [handler.reject], and other
//   ///  error interceptor(s) will be skipped.
//   void onError(
//     ApiError err,
//     ErrorInterceptorHandler handler,
//   ) =>
//       handler.next(err);
// }

// typedef InterceptorSendCallback = void Function(
//   RequestOptions options,
//   RequestInterceptorHandler handler,
// );

// typedef InterceptorSuccessCallback = void Function(
//   Response e,
//   ResponseInterceptorHandler handler,
// );

// typedef InterceptorErrorCallback = void Function(
//   ApiError e,
//   ErrorInterceptorHandler handler,
// );

// /// [InterceptorsWrapper] is a helper class, which is used to conveniently
// /// create interceptor(s). More details see [Interceptor].
// class InterceptorsWrapper extends Interceptor {
//   final InterceptorSendCallback? _onRequest;

//   final InterceptorSuccessCallback? _onResponse;

//   final InterceptorErrorCallback? _onError;

//   InterceptorsWrapper({
//     InterceptorSendCallback? onRequest,
//     InterceptorSuccessCallback? onResponse,
//     InterceptorErrorCallback? onError,
//   })  : _onRequest = onRequest,
//         _onResponse = onResponse,
//         _onError = onError;

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) {
//     if (_onRequest != null) {
//       _onRequest!(options, handler);
//     } else {
//       handler.next(options);
//     }
//   }

//   @override
//   void onResponse(
//     Response response,
//     ResponseInterceptorHandler handler,
//   ) {
//     if (_onResponse != null) {
//       _onResponse!(response, handler);
//     } else {
//       handler.next(response);
//     }
//   }

//   @override
//   void onError(
//     ApiError err,
//     ErrorInterceptorHandler handler,
//   ) {
//     if (_onError != null) {
//       _onError!(err, handler);
//     } else {
//       handler.next(err);
//     }
//   }
// }

// /// Interceptors are a queue, and you can add any number of interceptors,
// /// All interceptors will be executed in first in first out order.
// class Interceptors extends ListMixin<Interceptor> {
//   final _list = <Interceptor>[];
//   final Lock _requestLock = Lock();
//   final Lock _responseLock = Lock();
//   final Lock _errorLock = Lock();

//   Lock get requestLock => _requestLock;

//   Lock get responseLock => _responseLock;

//   Lock get errorLock => _errorLock;

//   @override
//   int length = 0;

//   @override
//   Interceptor operator [](int index) {
//     return _list[index];
//   }

//   @override
//   void operator []=(int index, value) {
//     if (_list.length == index) {
//       _list.add(value);
//     } else {
//       _list[index] = value;
//     }
//   }
// }
