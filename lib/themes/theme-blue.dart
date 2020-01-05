import 'package:flutter/material.dart';

appTheme(String themeColor) {
  switch (themeColor) {
    case "blue":
      return ThemeData(primarySwatch: Colors.blue);
      break;
    case "red":
      return ThemeData(primarySwatch: Colors.red);
      break;
    case "green":
      return ThemeData(primarySwatch: Colors.green);
      break;
    case "yellow":
      return ThemeData(primarySwatch: Colors.yellow);
      break;
  }
}
