import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/util/initializer.dart';
import 'package:getx_start_project/app/common/values/styles/theme.dart';
import 'package:getx_start_project/app/routes/app_pages.dart';

import 'app/modules/widgets/base_widget.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (_, child) => BaseWidget(
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
