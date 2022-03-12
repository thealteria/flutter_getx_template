import 'package:flutter_getx_template/app/common/storage/storage.dart';
import 'package:flutter_getx_template/app/data/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiHelper _apiHelper = ApiHelper.to;

  final RxList _dataList = RxList();
  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);

  @override
  void onReady() {
    super.onReady();

    getPosts();
  }

  void getPosts() {
    _apiHelper.getPosts().futureValue(
          (value) => dataList = value,
          retryFunction: getPosts,
        );
  }

  void onEditProfileClick() {
    Get.back();
  }

  void onFaqsClick() {
    Get.back();
  }

  void onLogoutClick() {
    Storage.clearStorage();
    // Get.offAllNamed(Routes.HOME);
    //Specify the INITIAL SCREEN you want to display to the user after logout
  }
}
