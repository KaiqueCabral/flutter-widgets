import 'package:flutter/material.dart';

appTheme(MaterialColor themeColor) {
  return ThemeData(
    primarySwatch: themeColor,
    dividerTheme: DividerThemeData(
      color: Colors.blue[100],
      space: 20,
      thickness: 5,
      indent: 20,
      endIndent: 0,
    ),
  );
}
