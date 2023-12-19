import 'package:flutter/material.dart';

import '../Resources/color_const.dart';

class CustomTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
        primaryColor: kPrimary,
        colorScheme: const ColorScheme.light(background: kWhite, error: kWhite),
        scaffoldBackgroundColor: kWhite,
        cardColor: kBackgroundCard,
        dialogBackgroundColor: kYellow);
  }
}
