import 'package:get/get.dart';

export 'package:getx_start_project/app/common/util/extensions.dart';
export 'package:getx_start_project/app/common/util/utils.dart';

abstract class ApiHelper {
  Future<Response> getPosts();
}
