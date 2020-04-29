import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/Styling/034_media-query/media-query.dart';
import 'package:widget_tests/widgets/Styling/061_color-filtered/color-filtered.dart';

class MenuStyling {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuStyling({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.color_lens, "Color Filtered",
          ColorFilteredPage.routeName, context),
      menu.getNavItem(Icons.screen_rotation, "Media Query",
          MediaQueryPage.routeName, context),
    ];
  }
}
