import 'package:flutter/material.dart';
import 'package:widget_tests/themes/theme-blue.dart';
import 'package:widget_tests/widgets/003_wrap/wrap.dart';
import 'package:widget_tests/widgets/home/home.dart';
import 'package:widget_tests/widgets/001_safe-area/safe-area.dart';
import 'package:widget_tests/widgets/002_expanded/expanded.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home: HomePage(title: 'Flutter Study Home Page'),
      routes: <String, WidgetBuilder>{
        SafeAreaPage.routeName: (BuildContext context) => SafeAreaPage(),
        ExpandedPage.routeName: (BuildContext context) => ExpandedPage(),
        WrapPage.routeName: (BuildContext context) => WrapPage()
      }
    );
  }
}