import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
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
import 'package:widget_tests/widgets/Layout/038_aspect-ratio/aspect-ratio.dart';
import 'package:widget_tests/widgets/Layout/039_limited-box/limited-box.dart';
import 'package:widget_tests/widgets/Layout/046_indexed-stack/indexed-stack.dart';
import 'package:widget_tests/widgets/Layout/048_constrained-box/constrained-box.dart';
import 'package:widget_tests/widgets/Layout/049_stack/stack.dart';
import 'package:widget_tests/widgets/Layout/051_fractionally-sized-box/fractionally-sized-box.dart';
import 'package:widget_tests/widgets/Layout/052_list-view/list-view.dart';
import 'package:widget_tests/widgets/Layout/054_container/container.dart';
import 'package:widget_tests/widgets/Layout/066_tab-bar/default-tab-controller.dart';
import 'package:widget_tests/widgets/Layout/069_list-wheel-scroll-view/list-wheel-scroll-view.dart';
import 'package:widget_tests/widgets/MaterialComponents/053_list-tile/list-tile.dart';

class MenuLayout {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuLayout({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.vertical_align_bottom, "Align", AlignPage.routeName, context),
      menu.getNavItem(Icons.aspect_ratio, "Aspect Ratio",
          AspectRatioPage.routeName, context),
      menu.getNavItem(Icons.add_box, "Constrained Box",
          ConstrainedBoxPage.routeName, context),
      menu.getNavItem(Icons.indeterminate_check_box, "Container",
          ContainerPage.routeName, context),
      menu.getNavItem(
          Icons.zoom_out_map, "Expanded", ExpandedPage.routeName, context),
      menu.getNavItem(
          Icons.add_box, "Fitted Box", FittedBoxPage.routeName, context),
      menu.getNavItem(Icons.panorama_wide_angle, "Flexible",
          FlexiblePage.routeName, context),
      menu.getNavItem(Icons.aspect_ratio, "Fractionally Sized Box",
          FractionallySizedBoxPage.routeName, context),
      menu.getNavItem(
          Icons.layers, "Indexed Stack", IndexedStackPage.routeName, context),
      menu.getNavItem(
          Icons.pages, "Layout Builder", LayoutBuilderPage.routeName, context),
      menu.getNavItem(Icons.list, "List View", ListViewPage.routeName, context),
      menu.getNavItem(Icons.list, "List Wheel Scroll View",
          ListWheelScrollViewPage.routeName, context),
      menu.getNavItem(
          Icons.crop_square, "Limited Box", LimitedBoxPage.routeName, context),
      menu.getNavItem(Icons.list, "List Tile", ListTilePage.routeName, context),
      menu.getNavItem(Icons.vertical_align_top, "Positioned",
          PositionedPage.routeName, context),
      menu.getNavItem(
          Icons.crop_square, "Safe Area", SafeAreaPage.routeName, context),
      menu.getNavItem(Icons.photo_size_select_large, "Sized Box",
          SizedBoxPage.routeName, context),
      menu.getNavItem(Icons.calendar_view_day, "Sliver List/Grid",
          SliverListGridPage.routeName, context),
      menu.getNavItem(Icons.space_bar, "Spacer", SpacerPage.routeName, context),
      menu.getNavItem(Icons.layers, "Stack", StackPage.routeName, context),
      menu.getNavItem(Icons.table_chart, "Table", TablePage.routeName, context),
      menu.getNavItem(Icons.tab, "Tabs", TabsPage.routeName, context),
      menu.getNavItem(Icons.wrap_text, "Wrap", WrapPage.routeName, context),
    ];
  }
}
