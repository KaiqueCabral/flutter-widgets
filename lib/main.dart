import 'package:flutter/material.dart';
import 'package:widget_tests/routes.dart';
import 'package:widget_tests/themes/theme-blue.dart';
import 'package:widget_tests/widgets/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   Admob.initialize(AdsAdmob.getAppId());
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      checkerboardOffscreenLayers: false,
      title: 'Flutter Widgets',
      theme: appTheme(Colors.blue),
      home: HomePage(
        title: 'Flutter Widgets Home Page',
      ),
      routes: routes(),
    );
  }
}
