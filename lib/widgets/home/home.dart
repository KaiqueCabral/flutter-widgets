import 'package:flutter/material.dart';
import 'package:widget_tests/widgets/AnimationMotion/037_animated-icon/animated-icon.dart';
import 'package:widget_tests/widgets/Basics/036_inherited-widget/inherited-widget.dart';
import 'package:widget_tests/widgets/Layout/038_aspect-ratio/aspect-ratio.dart';
import 'about.dart';
import 'drawer-header.dart';
import 'package:widget_tests/widgets/AnimationMotion/004_animated-container/animated-container.dart';
import 'package:widget_tests/widgets/AnimationMotion/007_fade-transition/fade-transition.dart';
import 'package:widget_tests/widgets/AnimationMotion/013_fade-in-image/fade-in-image.dart';
import 'package:widget_tests/widgets/AnimationMotion/027_animated-builder/animated-builder.dart';
import 'package:widget_tests/widgets/AnimationMotion/032_animated-list/animated-list.dart';
import 'package:widget_tests/widgets/Async/006_future-builder/future-builder.dart';
import 'package:widget_tests/widgets/Async/014_stream-builder/stream-builder.dart';
import 'package:widget_tests/widgets/Async/030_value-listenable-builder/value-listenable-builder.dart';
import 'package:widget_tests/widgets/Basics/015_inherited-model/inherited-model.dart';
import 'package:widget_tests/widgets/InteractionModels/017_hero/hero.dart';
import 'package:widget_tests/widgets/InteractionModels/022_absorb-pointer/absorb-pointer.dart';
import 'package:widget_tests/widgets/InteractionModels/028_dismissible/dismissible.dart';
import 'package:widget_tests/widgets/InteractionModels/031_draggable/draggable.dart';
import 'package:widget_tests/widgets/Layout/001_safe-area/safe-area.dart';
import 'package:widget_tests/widgets/Layout/002_expanded/expanded.dart';
import 'package:widget_tests/widgets/Layout/003_wrap/wrap.dart';
import 'package:widget_tests/widgets/Layout/010_table/table.dart';
import 'package:widget_tests/widgets/Layout/012_sliver-list-grid/sliver-list-grid.dart';
import 'package:widget_tests/widgets/Layout/020_fitted-box/fitted-box.dart';
import 'package:widget_tests/widgets/Layout/021_layout-builder/layout-builder.dart';
import 'package:widget_tests/widgets/Layout/025_align/align.dart';
import 'package:widget_tests/widgets/Layout/026_positioned/positioned.dart';
import 'package:widget_tests/widgets/Layout/029_sized-box/sized-box.dart';
import 'package:widget_tests/widgets/Layout/033_flexible/flexible.dart';
import 'package:widget_tests/widgets/Layout/035_spacer/spacer.dart';
import 'package:widget_tests/widgets/MaterialComponents/008_floating-action-button/floating-action-button.dart';
import 'package:widget_tests/widgets/MaterialComponents/011_sliver-app-bar/sliver-app-bar.dart';
import 'package:widget_tests/widgets/MaterialComponents/019_tooltip/tooltip.dart';
import 'package:widget_tests/widgets/PaintingEffects/005_opacity/opacity.dart';
import 'package:widget_tests/widgets/PaintingEffects/016_clip-r-rect/clip-r-rect.dart';
import 'package:widget_tests/widgets/PaintingEffects/018_custom-paint/custom-paint.dart';
import 'package:widget_tests/widgets/PaintingEffects/023_transform/transform.dart';
import 'package:widget_tests/widgets/PaintingEffects/024_backdrop-filter/backdrop-filter.dart';
import 'package:widget_tests/widgets/Scrolling/009_page-view/page-view.dart';
import 'package:widget_tests/widgets/Styling/034_media-query/media-query.dart';

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
      getNavItem(Icons.mouse, "Absorb Pointer", AbsorbPointerPage.routeName),
      getNavItem(Icons.vertical_align_bottom, "Align", AlignPage.routeName),
      getNavItem(Icons.view_carousel, "Animated Builder",
          AnimatedBuilderPage.routeName),
      getNavItem(Icons.view_carousel, "Animated Container",
          AnimatedContainerPage.routeName),
      getNavItem(Icons.play_arrow, "Animated Icon", AnimatedIconPage.routeName),
      getNavItem(Icons.line_style, "Animated List", AnimatedListPage.routeName),
      getNavItem(Icons.aspect_ratio, "Aspect Ratio", AspectRatioPage.routeName),
      getNavItem(Icons.filter, "Backdrop Filter", BackdropFilterPage.routeName),
      getNavItem(Icons.rounded_corner, "ClipRRect", ClipRRectPage.routeName),
      getNavItem(Icons.format_paint, "Custom Paint", CustomPaintPage.routeName),
      getNavItem(Icons.drag_handle, "Draggable", DraggablePage.routeName),
      getNavItem(Icons.arrow_left, "Dismissible", DismissiblePage.routeName),
      getNavItem(Icons.zoom_out_map, "Expanded", ExpandedPage.routeName),
      getNavItem(
          Icons.image_aspect_ratio, "Fade In Image", FadeInImagePage.routeName),
      getNavItem(Icons.mood, "Fade Transition", FadeTransitionPage.routeName),
      getNavItem(Icons.add_box, "Fitted Box", FittedBoxPage.routeName),
      getNavItem(Icons.panorama_wide_angle, "Flexible", FlexiblePage.routeName),
      getNavItem(Icons.touch_app, "Floating Action Button",
          FloatingActionButtonPage.routeName),
      getNavItem(Icons.arrow_forward_ios, "Future Builder",
          FutureBuilderPage.routeName),
      getNavItem(Icons.transit_enterexit, "Hero", HeroPage.routeName),
      getNavItem(Icons.add, "Inherited Model", InheritedModelPage.routeName),
      getNavItem(Icons.add, "Inherited Widget", InheritedWidgetPage.routeName),
      getNavItem(Icons.pages, "Layout Builder", LayoutBuilderPage.routeName),
      getNavItem(
          Icons.screen_rotation, "Media Query", MediaQueryPage.routeName),
      getNavItem(Icons.opacity, "Opacity", OpacityPage.routeName),
      getNavItem(Icons.pageview, "Page View", PageViewPage.routeName),
      getNavItem(
          Icons.vertical_align_top, "Positioned", PositionedPage.routeName),
      getNavItem(Icons.crop_square, "Safe Area", SafeAreaPage.routeName),
      getNavItem(
          Icons.photo_size_select_large, "Sized Box", SizedBoxPage.routeName),
      getNavItem(Icons.calendar_view_day, "Sliver App Bar",
          SliverAppBarPage.routeName),
      getNavItem(Icons.calendar_view_day, "Sliver List/Grid",
          SliverListGridPage.routeName),
      getNavItem(Icons.space_bar, "Spacer", SpacerPage.routeName),
      getNavItem(
          Icons.view_stream, "Stream Builder", StreamBuilderPage.routeName),
      getNavItem(Icons.table_chart, "Table", TablePage.routeName),
      getNavItem(Icons.title, "Tooltip", TooltipPage.routeName),
      getNavItem(Icons.transform, "Transform", TransformPage.routeName),
      getNavItem(Icons.queue, "Value Listenable Builder",
          ValueListenableBuilderPage.routeName),
      getNavItem(Icons.wrap_text, "Wrap", WrapPage.routeName),
      aboutChild
    ];

    ListView listView = ListView(padding: EdgeInsets.zero, children: navItems);

    return Drawer(child: listView, elevation: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Use the menu to check the widgets"),
      ),
      drawer: getNavDrawer(context),
    );
  }
}
