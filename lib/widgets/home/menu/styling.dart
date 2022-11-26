import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Styling/034_media-query/media-query.dart';
import 'package:flutter_widgets/widgets/Styling/061_color-filtered/color-filtered.dart';

class MenuStyling {
  final BuildContext context;
  final Menu menu;
  late List<Widget> subItems;

  MenuStyling({required this.context, required this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.color_lens, "Color Filtered",
          ColorFilteredPage.routeName, context),
      menu.getNavItem(Icons.screen_rotation, "Media Query",
          MediaQueryPage.routeName, context),
    ];
  }
}
