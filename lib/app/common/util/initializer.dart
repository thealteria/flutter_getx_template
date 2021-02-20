import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_start_project/app/data/api_helper.dart';
import 'package:getx_start_project/app/data/interface_controller/api_interface_controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      await _initStorage();

      _initScreenPreference();
      _initApis();
    } catch (err) {
      rethrow;
    }
  }

  static void _initApis() {
    Get.put<ApiHelper>(
      ApiHelper(),
    );

    Get.put<ApiInterfaceController>(
      ApiInterfaceController(),
    );
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
