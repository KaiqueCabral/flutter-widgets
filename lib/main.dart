import 'package:flutter/material.dart';
import 'package:widget_tests/themes/theme-blue.dart';
import 'package:widget_tests/widgets/001_safe-area/safe-area.dart';
import 'package:widget_tests/widgets/002_expanded/expanded.dart';
import 'package:widget_tests/widgets/003_wrap/wrap.dart';
import 'package:widget_tests/widgets/004_animated-container/animated-container.dart';
import 'package:widget_tests/widgets/005_opacity/opacity.dart';
import 'package:widget_tests/widgets/006_future-builder/future-builder.dart';
import 'package:widget_tests/widgets/007_fade-transition/fade-transition.dart';
import 'package:widget_tests/widgets/008_floating-action-button/floating-action-button.dart';
import 'package:widget_tests/widgets/009_page-view/page-view.dart';
import 'package:widget_tests/widgets/010_table/table.dart';
import 'package:widget_tests/widgets/011_sliver-app-bar/sliver-app-bar.dart';
import 'package:widget_tests/widgets/012_sliver-list-grid/sliver-list-grid.dart';
import 'package:widget_tests/widgets/013_fade-in-image/fade-in-image.dart';
import 'package:widget_tests/widgets/014_stream-builder/stream-builder.dart';
import 'package:widget_tests/widgets/015_inherited-model/inherited-model.dart';
import 'package:widget_tests/widgets/016_clip-r-rect/clip-r-rect.dart';
import 'package:widget_tests/widgets/017_hero/hero-details.dart';
import 'package:widget_tests/widgets/017_hero/hero.dart';
import 'package:widget_tests/widgets/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      checkerboardOffscreenLayers: false,
      theme: appTheme(Colors.blue),
      home: HomePage(title: 'Flutter Widgets Home Page'),
      routes: <String, WidgetBuilder>{
        AnimatedContainerPage.routeName: (BuildContext context) =>
            AnimatedContainerPage(),
        ClipRRectPage.routeName: (BuildContext context) => ClipRRectPage(),
        ExpandedPage.routeName: (BuildContext context) => ExpandedPage(),
        FadeInImagePage.routeName: (BuildContext context) => FadeInImagePage(),
        FadeTransitionPage.routeName: (BuildContext context) =>
            FadeTransitionPage(),
        FloatingActionButtonPage.routeName: (BuildContext context) =>
            FloatingActionButtonPage(),
        FutureBuilderPage.routeName: (BuildContext context) =>
            FutureBuilderPage(),
        HeroPage.routeName: (BuildContext context) => HeroPage(),
        HeroDetailsPage.routeName: (BuildContext context) => HeroDetailsPage(),
        InheritedModelPage.routeName: (BuildContext context) =>
            InheritedModelPage(),
        OpacityPage.routeName: (BuildContext context) => OpacityPage(),
        PageViewPage.routeName: (BuildContext context) => PageViewPage(),
        SafeAreaPage.routeName: (BuildContext context) => SafeAreaPage(),
        SliverAppBarPage.routeName: (BuildContext context) =>
            SliverAppBarPage(),
        SliverListGridPage.routeName: (BuildContext context) =>
            SliverListGridPage(),
        StreamBuilderPage.routeName: (BuildContext context) =>
            StreamBuilderPage(),
        TablePage.routeName: (BuildContext context) => TablePage(),
        WrapPage.routeName: (BuildContext context) => WrapPage(),
      },
    );
  }
}
