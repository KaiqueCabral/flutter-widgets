import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/Acessibility/047_semantics/semantics.dart';

class MenuAccessibility {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuAccessibility({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.textsms, "Semantics", SemanticsPage.routeName, context),
    ];
  }
}
