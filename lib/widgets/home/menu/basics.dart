import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Basics/015_inherited-model/inherited-model.dart';
import 'package:flutter_widgets/widgets/Basics/036_inherited-widget/inherited-widget.dart';
import 'package:flutter_widgets/widgets/Basics/040_place-holder/place-holder.dart';
import 'package:flutter_widgets/widgets/Basics/072_builder/builder.dart';

class MenuBasics {
  final BuildContext context;
  final Menu menu;
  late List<Widget> subItems;

  MenuBasics({required this.context, required this.menu}) {
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
