import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/AssetsImagesIcons/065_image/image.dart';

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
