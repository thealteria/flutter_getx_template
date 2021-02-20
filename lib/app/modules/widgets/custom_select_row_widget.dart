import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';
import 'package:getx_start_project/app/modules/widgets/custom_raised_button.dart';

class CustomSelectRowWidget extends StatelessWidget {
  final String title, buttonText;
  final Function onAdd;

  const CustomSelectRowWidget({
    Key key,
    @required this.title,
    @required this.onAdd,
    @required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.regularStyle(
              fontSize: Dimens.fontSize16,
              color: AppColors.mineShaft,
            ),
          ),
          CustomRaisedButton(
            title: buttonText,
            onPressed: onAdd,
          )
        ],
      ),
    );
  }
}
