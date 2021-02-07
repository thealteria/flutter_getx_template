import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/modules/sign_in/controllers/home_controller.dart';
import 'package:getx_start_project/app/modules/widgets/base_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    print('HomeView build');

    controller.getPosts();
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.home),
        centerTitle: true,
      ),
      body: BaseWidget(
        child: Obx(
          () {
            print('ListView');
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: controller.dataList.length,
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                dynamic _data = controller.dataList[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${_data['title'].toString()}',
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Body: ${_data['body'].toString()}',
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
