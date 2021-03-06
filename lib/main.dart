import 'package:flutter/material.dart';
import 'package:flutter_widgets/routes.dart';
import 'package:flutter_widgets/themes/theme-blue.dart';
import 'package:flutter_widgets/widgets/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      checkerboardOffscreenLayers: false,
      title: "Flutter Widgets",
      theme: appTheme(Colors.blue),
      home: HomePage(
        title: "Flutter Widgets Home Page",
      ),
      routes: routes(),
    );
  }
}
