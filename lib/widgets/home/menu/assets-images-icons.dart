import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/AssetsImagesIcons/065_image/image.dart';

class MenuAssetsImagesIcons {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuAssetsImagesIcons({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.image, "Image", ImagePage.routeName, context),
    ];
  }
}
