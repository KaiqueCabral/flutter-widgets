import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Text/041_rich-text/rich-text.dart';
import 'package:flutter_widgets/widgets/Text/055_selectable-text/selectable-text.dart';

class MenuText {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuText({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.text_fields, "Rich Text", RichTextPage.routeName, context),
      menu.getNavItem(Icons.text_format, "Selectable Text",
          SelectableTextPage.routeName, context),
    ];
  }
}
