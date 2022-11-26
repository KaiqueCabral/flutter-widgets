import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Acessibility/047_semantics/semantics.dart';

class MenuAccessibility {
  final BuildContext context;
  final Menu menu;
  late List<Widget> subItems;

  MenuAccessibility({required this.context, required this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.textsms, "Semantics", SemanticsPage.routeName, context),
    ];
  }
}
