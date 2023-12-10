import 'package:flutter/material.dart';

import '../Resources/color_const.dart';

class CustomTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      primaryColor: kPrimary,
      colorScheme: const ColorScheme.light(background: kWhite, error: kError),
      scaffoldBackgroundColor: kWhite,
      cardColor: kBackgroundCard,
    );
  }
}
