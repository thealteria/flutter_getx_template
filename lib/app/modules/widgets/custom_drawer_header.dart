import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/modules/home/controllers/home_controller.dart';
import 'package:getx_start_project/app/modules/widgets/custom_row_text_widget.dart';

class CustomDrawerHeader extends StatelessWidget {
  final HomeController homeController;

  const CustomDrawerHeader({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 7.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: 5.borderRadius,
            child: FadeInImage.assetNetwork(
              placeholder: AppImages.icGallery,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              image: 'https://dummyimage.com/600x400/000/fff.jpg',
              imageErrorBuilder: (_, e, s) => const Icon(Icons.offline_bolt),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'First name',
                        style: AppTextStyle.semiBoldStyle.copyWith(
                          fontSize: Dimens.fontSize16,
                        ),
                      ),
                      InkWell(
                        onTap: homeController.onEditProfileClick,
                        child: const Icon(Icons.edit),
                      )
                    ],
                  ),
                  SizedBox(height: 4.w),
                  const CustomRowTextWidget(
                    title: '${Strings.mobile}: ',
                    subtitle: '+91123456789',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
