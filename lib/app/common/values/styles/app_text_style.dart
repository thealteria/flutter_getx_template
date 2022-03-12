import 'package:flutter/material.dart';

import 'dimens.dart';

abstract class AppTextStyle {
  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  static final TextStyle headline1 = lightStyle.copyWith(
    fontSize: Dimens.fontSize96,
    letterSpacing: -1.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline2    60.0  light   -0.5
  static final TextStyle headline2 = lightStyle.copyWith(
    fontSize: Dimens.fontSize60,
    letterSpacing: -0.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline3    48.0  regular  0.0
  static final TextStyle headline3 = regularStyle.copyWith(
    fontSize: Dimens.fontSize48,
    letterSpacing: 0,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline4    34.0  regular  0.25
  static final TextStyle headline4 = regularStyle.copyWith(
    fontSize: Dimens.fontSize34,
    letterSpacing: 0.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline5    24.0  regular  0.0
  static final TextStyle headline5 = regularStyle.copyWith(
    fontSize: Dimens.fontSize24,
    letterSpacing: 0,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// headline6    20.0  medium   0.15
  static final TextStyle headline6 = mediumStyle.copyWith(
    fontSize: Dimens.fontSize20,
    letterSpacing: 0.15,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// subtitle1    16.0  regular  0.15
  static final TextStyle subtitle1 = regularStyle.copyWith(
    fontSize: Dimens.fontSize16,
    letterSpacing: 0.15,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// subtitle2    14.0  medium   0.1
  static final TextStyle subtitle2 = mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 0.1,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// body1        16.0  regular  0.5   (bodyText1)
  static final TextStyle body1 = regularStyle.copyWith(
    fontSize: Dimens.fontSize16,
    letterSpacing: 0.5,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// body2        14.0  regular  0.25  (bodyText2)
  static final TextStyle body2 = regularStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 0.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// button       14.0  medium   1.25
  static final TextStyle button = mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
    letterSpacing: 1.25,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// caption      12.0  regular  0.4
  static final TextStyle caption = regularStyle.copyWith(
    fontSize: Dimens.fontSize12,
    letterSpacing: .4,
  );

  /// NAME         SIZE  WEIGHT  SPACING
  /// overline     10.0  regular  1.5
  static final TextStyle overline = regularStyle.copyWith(
    fontSize: Dimens.fontSize10,
    letterSpacing: 1.5,
  );

  static final TextStyle lightStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w300,
  );

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w400,
  );

  static final TextStyle mediumStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle _textStyle = TextStyle(
    color: Colors.black,
  );

  static TextTheme get textTheme => TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
        bodyText1: body1,
        bodyText2: body2,
        caption: caption,
        button: button,
        overline: overline,
      );
}
