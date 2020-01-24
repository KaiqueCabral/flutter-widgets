import 'package:flutter/material.dart';
import 'package:widget_tests/widgets/016_clip-r-rect/clip-r-rect.dart';
import 'package:widget_tests/widgets/017_hero/hero.dart';
import 'package:widget_tests/widgets/018_custom-paint/custom-paint.dart';
import 'package:widget_tests/widgets/019_tooltip/tooltip.dart';
import 'package:widget_tests/widgets/020_fitted-box/fitted-box.dart';
import 'package:widget_tests/widgets/021_layout-builder/layout-builder.dart';
import 'about.dart';
import 'drawer-header.dart';
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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Drawer getNavDrawer(BuildContext context) {
    DrawerHeader header = appDrawerHeader();
    AboutListTile aboutChild = appAbout();

    ListTile getNavItem(IconData icon, String title, String routeName) {
      return ListTile(
        leading: Icon(
          icon,
          color: Colors.lightBlueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var navItems = [
      header,
      getNavItem(Icons.view_carousel, "Animated Container",
          AnimatedContainerPage.routeName),
      getNavItem(Icons.rounded_corner, "ClipRRect", ClipRRectPage.routeName),
      getNavItem(Icons.format_paint, "Custom Paint", CustomPaintPage.routeName),
      getNavItem(Icons.zoom_out_map, "Expanded", ExpandedPage.routeName),
      getNavItem(
          Icons.image_aspect_ratio, "Fade In Image", FadeInImagePage.routeName),
      getNavItem(Icons.mood, "Fade Transition", FadeTransitionPage.routeName),
      getNavItem(Icons.add_box, "Fitted Box", FittedBoxPage.routeName),
      getNavItem(Icons.touch_app, "Floating Action Button",
          FloatingActionButtonPage.routeName),
      getNavItem(Icons.arrow_forward_ios, "Future Builder",
          FutureBuilderPage.routeName),
      getNavItem(Icons.transit_enterexit, "Hero", HeroPage.routeName),
      getNavItem(Icons.add, "Inherited Model", InheritedModelPage.routeName),
      getNavItem(Icons.pages, "Layout Builder", LayoutBuilderPage.routeName),
      getNavItem(Icons.opacity, "Opacity", OpacityPage.routeName),
      getNavItem(Icons.pageview, "Page View", PageViewPage.routeName),
      getNavItem(Icons.crop_square, "Safe Area", SafeAreaPage.routeName),
      getNavItem(Icons.calendar_view_day, "Sliver App Bar",
          SliverAppBarPage.routeName),
      getNavItem(Icons.calendar_view_day, "Sliver List/Grid",
          SliverListGridPage.routeName),
      getNavItem(
          Icons.view_stream, "Stream Builder", StreamBuilderPage.routeName),
      getNavItem(Icons.table_chart, "Table", TablePage.routeName),
      getNavItem(Icons.title, "Tooltip", TooltipPage.routeName),
      getNavItem(Icons.wrap_text, "Wrap", WrapPage.routeName),
      aboutChild
    ];

    ListView listView = ListView(padding: EdgeInsets.zero, children: navItems);

    return Drawer(child: listView, elevation: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text("Use the menu to check the widgets")),
      drawer: getNavDrawer(context),
    );
  }
}
