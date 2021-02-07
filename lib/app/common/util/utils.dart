import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/modules/widgets/custom_inkwell_text.dart';

class Utils {
  static Future<void> showDialog(
    String message, {
    String title: Strings.error,
    Function onTap,
  }) =>
      Get.defaultDialog(
        title: title,
        content: Text(message ?? Strings.somethingWentWrong),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: CustomInkwellText(
            onTap: onTap ?? () => Get.back(),
            title: Strings.ok,
            textStyle: AppTextStyle.buttonTextStyle(),
          ),
        ),
      );

  static get loadingDialog =>
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Utils.closeDialog();

        Get.dialog(
          const Center(
            child: const CircularProgressIndicator(),
          ),
        );
      });

  static void closeDialog() {
    if (Get.isDialogOpen) Get.back();
  }
}
