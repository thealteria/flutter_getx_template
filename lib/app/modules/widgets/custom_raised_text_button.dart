import 'package:flutter/material.dart';
import 'package:getx_start_project/app/common/util/exports.dart';

class CustomRaisedTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomRaisedTextButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyle.buttonTextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
