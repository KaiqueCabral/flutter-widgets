import 'package:flutter/material.dart';
import 'package:widget_tests/themes/theme-blue.dart';
import 'package:widget_tests/widgets/home/home.dart';
import 'package:widget_tests/widgets/001_safe-area/safe-area.dart';
import 'package:widget_tests/widgets/002_expanded/expanded.dart';
import 'package:widget_tests/widgets/003_wrap/wrap.dart';
import 'package:widget_tests/widgets/004_animated-container/animated-container.dart';
import 'package:widget_tests/widgets/005_opacity/opacity.dart';
import 'package:widget_tests/widgets/006_future-builder/future-builder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme("blue"),
      home: HomePage(title: 'Flutter Widgets Home Page'),
      routes: <String, WidgetBuilder>{
        AnimatedContainerPage.routeName: (BuildContext context) => AnimatedContainerPage(),
        ExpandedPage.routeName: (BuildContext context) => ExpandedPage(),
        FutureBuilderPage.routeName: (BuildContext context) => FutureBuilderPage(),
        OpacityPage.routeName: (BuildContext context) => OpacityPage(),
        SafeAreaPage.routeName: (BuildContext context) => SafeAreaPage(),
        WrapPage.routeName: (BuildContext context) => WrapPage(),
      }
    );
  }
}