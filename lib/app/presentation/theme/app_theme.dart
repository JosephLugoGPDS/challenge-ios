

import 'package:flutter/cupertino.dart';

abstract class AppTheme {
  //* Colors
  static const Color primaryColor = Color(0xffFF8960);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color accentColor = Color(0xffF05522);
  static const Color grayColor = Color(0xffDAD9E2);
  static const Color grayDarkColor = Color(0xff9B9B9B);
  static const Color blackColor = Color(0xff262628);
  static const Color purpleColor = Color(0xffB739F3);
  static const Color redColor = Color(0xffDA251D);
  static const Color barBackgroundColor = Color(0xff4A4A4A);

  static CupertinoThemeData themeMobile(BuildContext context) {
    return CupertinoTheme.of(context).copyWith(
      primaryColor: primaryColor,
      barBackgroundColor: barBackgroundColor,
      scaffoldBackgroundColor: whiteColor,
      primaryContrastingColor: accentColor,
    );
  }
}
