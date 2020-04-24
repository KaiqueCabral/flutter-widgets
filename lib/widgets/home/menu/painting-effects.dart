import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/PaintingEffects/005_opacity/opacity.dart';
import 'package:widget_tests/widgets/PaintingEffects/016_clip-r-rect/clip-r-rect.dart';
import 'package:widget_tests/widgets/PaintingEffects/018_custom-paint/custom-paint.dart';
import 'package:widget_tests/widgets/PaintingEffects/023_transform/transform.dart';
import 'package:widget_tests/widgets/PaintingEffects/024_backdrop-filter/backdrop-filter.dart';
import 'package:widget_tests/widgets/PaintingEffects/070_shader-mask/shader-mask.dart';

class MenuPaintingEffects {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuPaintingEffects({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.filter, "Backdrop Filter",
          BackdropFilterPage.routeName, context),
      menu.getNavItem(
          Icons.rounded_corner, "ClipRRect", ClipRRectPage.routeName, context),
      menu.getNavItem(Icons.format_paint, "Custom Paint",
          CustomPaintPage.routeName, context),
      menu.getNavItem(Icons.opacity, "Opacity", OpacityPage.routeName, context),
      menu.getNavItem(
          Icons.gradient, "Shader Mask", ShaderMaskPage.routeName, context),
      menu.getNavItem(
          Icons.transform, "Transform", TransformPage.routeName, context),
    ];
  }
}
