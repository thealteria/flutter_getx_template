import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/common/values/styles/app_text_style.dart';
import 'package:getx_start_project/app/modules/widgets/custom_inkwell_text.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Utils._();

  static Future<void> showDialog(
    String message, {
    String title = Strings.error,
    Function() onTap,
  }) =>
      Get.defaultDialog(
        title: title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          style: AppTextStyle.semiBoldStyle(
            color: Colors.black,
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: CustomInkwellText(
            onTap: onTap ?? () => Get.back(),
            title: Strings.ok,
            textStyle: AppTextStyle.buttonTextStyle(
              fontSize: Dimens.fontSize18,
            ),
          ),
        ),
      );

  static void timePicker(
    Function(String time) onSelectTime, {
    TimeOfDay initialTime,
  }) {
    showTimePicker(
      context: Get.overlayContext,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      if (v != null) {
        final _now = DateTime.now();
        final _dateTime = DateTime(
          _now.year,
          _now.month,
          _now.day,
          v.hour,
          v.minute,
        );

        onSelectTime(_dateTime.formatedDate(dateFormat: 'hh:mm aa'));
      }
    });
  }

  static void loadingDialog() =>
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Utils.closeDialog();

        Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
      });

  static void closeDialog() {
    if (Get.isDialogOpen) {
      Get.back();
    }
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void goBackToScreen(String routeName) {
    Get.until(
      (route) => Get.currentRoute == routeName,
    );
  }

  //image picker bottomsheet
  static Future<void> showImagePicker({
    @required Function(File image) onGetImage,
  }) {
    return showModalBottomSheet<void>(
      context: Get.context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage(source: 2).then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.image,
                        size: 60.w,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        Strings.gallery,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semiBoldStyle(
                          color: Colors.black,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    getImage().then((v) {
                      if (v != null) {
                        onGetImage(v);
                        Get.back();
                      }
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera,
                        size: 60.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        Strings.camera,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semiBoldStyle(
                          color: Colors.black,
                          fontSize: Dimens.fontSize16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //crop image after picking
  static Future<File> getImage({int source = 1}) async {
    File croppedFile;
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      source: source == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 60,
    );

    if (pickedFile != null) {
      final image = File(pickedFile?.path);

      if (image != null) {
        croppedFile = await ImageCropper.cropImage(
          compressQuality: 50,
          sourcePath: image?.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
            toolbarColor: Colors.transparent,
            toolbarWidgetColor: Colors.transparent,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 0.1,
            aspectRatioLockDimensionSwapEnabled: true,
          ),
        );
      }
    }

    return croppedFile;
  }
}
