import 'package:flutter/material.dart';
import 'package:widget_tests/routes.dart';
import 'package:widget_tests/themes/theme-blue.dart';
import 'package:widget_tests/widgets/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      checkerboardOffscreenLayers: false,
      title: 'Flutter Demo',
      theme: appTheme(Colors.blue),
      home: HomePage(title: 'Flutter Widgets Home Page'),
      routes: routes(),
    );
  }
}
