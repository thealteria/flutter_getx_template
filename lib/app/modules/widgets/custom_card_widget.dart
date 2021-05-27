import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/modules/widgets/stroke_background.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget? trailing;
  final String? title, trailingText, leadingImage;
  final Function() onTap;
  final bool addForwardIcon;

  const CustomCardWidget({
    Key? key,
    this.leadingImage,
    required this.title,
    this.trailing,
    required this.onTap,
    this.trailingText,
    this.addForwardIcon = true,
  })  : assert(trailingText == null || trailing == null, Strings.error),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StrokeBackground(
      onTap: onTap,
      height: 68,
      child: Row(
        children: [
          if (leadingImage != null) ...[
            leadingImage!.imageAsset(
              size: Size(24.w, 24.w),
            ),
            SizedBox(width: 10.w),
          ],
          Text(
            title!,
            style: AppTextStyle.regularStyle.copyWith(
              color: AppColors.black,
              fontSize: Dimens.fontSize16,
            ),
          ),
          if (trailing != null) ...[
            const Spacer(),
            trailing!
          ] else if (trailingText != null) ...[
            const Spacer(),
            CircleAvatar(
              radius: 12.r,
              backgroundColor: AppColors.amaranth,
              child: Text(
                trailingText!,
                style: AppTextStyle.regularStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ] else
            const SizedBox.shrink(),
          if (addForwardIcon) ...[
            if (trailing == null && trailingText == null)
              const Spacer()
            else
              SizedBox(width: 10.w),
            const Icon(Icons.arrow_forward_ios_sharp),
          ],
        ],
      ),
    );
  }
}
