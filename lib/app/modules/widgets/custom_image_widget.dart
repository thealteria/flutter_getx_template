import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/constants.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final Size? size;
  final double? height, radius;
  final BorderRadius? borderRadius;
  final Color? color;

  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    this.size,
    this.radius,
    this.borderRadius,
    this.color,
    this.height,
  })  : assert(
          borderRadius == null || radius == null,
          'Cannot provide both a borderRadius and a radius\n',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return (radius != null || borderRadius != null)
        ? ClipRRect(
            borderRadius: borderRadius ?? radius?.borderRadius,
            child: child,
          )
        : child;
  }

  Widget get child =>
      imageUrl == null || (imageUrl != null && imageUrl!.isEmpty)
          ? placeholder
          : (GetUtils.isURL(imageUrl ?? Constants.dummyImageUrl) ||
                  imageUrl!.startsWith('https') ||
                  imageUrl!.startsWith('http')
              ? OctoImage(
                  image: NetworkImage(
                    imageUrl ?? Constants.dummyImageUrl,
                  ),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    Constants.placeHolderBlurHash,
                  ),
                  errorBuilder: (context, error, stackTrace) {
                    return placeholder;
                  },
                  fit: BoxFit.cover,
                  width: size?.width.w,
                  height: height?.w ?? size?.height.w,
                  color: color,
                )
              : (File(imageUrl!).existsSync()
                  ? Image.file(
                      File(imageUrl!),
                      width: size?.width.w,
                      height: height?.w ?? size?.height.w,
                      fit: BoxFit.cover,
                    )
                  : placeholder));

  Widget get placeholder => Icon(
        Icons.error,
        size: size?.width.w,
      );
}
