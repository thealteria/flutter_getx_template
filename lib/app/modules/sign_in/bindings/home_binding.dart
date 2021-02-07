import 'package:get/get.dart';
import 'package:getx_start_project/app/modules/sign_in/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
