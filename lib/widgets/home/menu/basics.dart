import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/Basics/015_inherited-model/inherited-model.dart';
import 'package:widget_tests/widgets/Basics/036_inherited-widget/inherited-widget.dart';
import 'package:widget_tests/widgets/Basics/040_place-holder/place-holder.dart';
import 'package:widget_tests/widgets/Basics/072_builder/builder.dart';

class MenuBasics {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuBasics({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.build, "Builder", BuilderPage.routeName, context),
      menu.getNavItem(
          Icons.add, "Inherited Model", InheritedModelPage.routeName, context),
      menu.getNavItem(Icons.add, "Inherited Widget",
          InheritedWidgetPage.routeName, context),
      menu.getNavItem(
          Icons.fullscreen, "Place Holder", PlaceHolderPage.routeName, context),
    ];
  }
}
