import 'package:get/get.dart';
import 'package:getx_start_project/app/data/api_helper.dart';

class HomeController extends GetxController {
  final ApiHelper _apiHelper = Get.find<ApiHelper>();

  RxList _dataList = RxList();

  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);

  @override
  void onReady() {
    super.onReady();

    // getPosts();
  }

  void getPosts() {
    _apiHelper.getPosts().futureValue(
          (value) => dataList = value,
          retryFunction: getPosts,
        );
  }
}
