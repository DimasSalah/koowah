import 'package:flutter/material.dart';

import 'constant.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CS.white,
    colorSchemeSeed: CS.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: CS.white,
      surfaceTintColor: Colors.transparent,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CS.black,
      selectionColor: CS.black,
      selectionHandleColor: CS.black,
    ),
  );
}
