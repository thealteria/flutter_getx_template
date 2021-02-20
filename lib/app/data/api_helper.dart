import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/constants.dart';
import 'package:getx_start_project/app/common/storage/storage.dart';
import 'package:getx_start_project/main.dart';

import 'app_reponse.dart';
import 'errors/app_errors.dart';

export 'package:getx_start_project/app/common/util/extensions.dart';
export 'package:getx_start_project/app/common/util/utils.dart';

class ApiHelper extends GetConnect with AppResponse {
  static const String BASE_URL = 'http://jsonplaceholder.typicode.com/';

  @override
  void onInit() {
    httpClient.baseUrl = BASE_URL;
    httpClient.timeout = const Duration(seconds: 3);

    addRequestModifier();
    ///call this function after the login so that it will 
    ///update the request modifier

    httpClient.addResponseModifier((request, response) {
      logger.i(
        'Status Code: ${response.statusCode}\n'
        'Data: ${response?.bodyString?.toString() ?? ''}',
      );

      return response;
    });
  }

  void addRequestModifier() {
    if (Storage.hasData(Constants.TOKEN)) {
      httpClient.addRequestModifier((request) async {
        request.headers['Authorization'] =
            'Bearer ${Storage.getValue(Constants.TOKEN)}';

        logger.i(
          'REQUEST ║ ${request.method.toUpperCase()}\n'
          'url: ${request.url}\n'
          'Headers: ${request.headers}\n',
        );
        return request;
      });
    }
  }

  Future<Either<AppErrors, dynamic>> getPosts() {
    return get('posts').then(
      (value) => getResponse(value),
    );
  }
}
