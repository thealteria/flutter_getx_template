import 'package:flutter/material.dart';

import 'dimens.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
  );
}
