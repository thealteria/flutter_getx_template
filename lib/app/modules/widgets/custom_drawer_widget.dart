import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/modules/home/controllers/home_controller.dart';
import 'package:getx_start_project/app/modules/widgets/custom_drawer_header.dart';
import 'package:getx_start_project/app/modules/widgets/custom_listtile_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  final HomeController controller;

  const CustomDrawerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDrawerHeader(
              homeController: controller,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Divider(
                thickness: 2.w,
                color: AppColors.doveGray.withOpacity(0.5),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CustomListTileWidget(
                    title: Strings.gallery,
                    onTap: controller.onFaqsClick,
                  ),
                ],
              ),
            ),
            CustomListTileWidget(
              title: Strings.logOut,
              onTap: controller.onLogoutClick,
            ),
          ],
        ),
      ),
    );
  }
}
