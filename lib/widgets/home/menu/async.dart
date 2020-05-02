import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Async/006_future-builder/future-builder.dart';
import 'package:flutter_widgets/widgets/Async/014_stream-builder/stream-builder.dart';
import 'package:flutter_widgets/widgets/Async/030_value-listenable-builder/value-listenable-builder.dart';

class MenuAsync {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuAsync({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.arrow_forward_ios, "Future Builder",
          FutureBuilderPage.routeName, context),
      menu.getNavItem(Icons.view_stream, "Stream Builder",
          StreamBuilderPage.routeName, context),
      menu.getNavItem(Icons.queue, "Value Listenable Builder",
          ValueListenableBuilderPage.routeName, context),
    ];
  }
}
