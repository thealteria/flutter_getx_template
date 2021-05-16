import 'package:flutter/material.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static TextStyle semiBoldStyle() {
    return _textStyle().copyWith(
      fontSize: Dimens.fontSize16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle boldStyle() {
    return _textStyle().copyWith(
      fontSize: Dimens.fontSize22,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle regularStyle() {
    return _textStyle().copyWith(
      fontSize: Dimens.fontSize18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle buttonTextStyle() {
    return _textStyle().copyWith(
      fontSize: Dimens.fontSize16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle _textStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: Dimens.fontSize14,
    );
  }
}
