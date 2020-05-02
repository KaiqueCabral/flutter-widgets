import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/005_opacity/opacity.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/016_clip-r-rect/clip-r-rect.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/018_custom-paint/custom-paint.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/023_transform/transform.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/024_backdrop-filter/backdrop-filter.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/070_shader-mask/shader-mask.dart';
import 'package:flutter_widgets/widgets/PaintingEffects/073_clip-path/clip-path.dart';

class MenuPaintingEffects {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuPaintingEffects({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.filter, "Backdrop Filter",
          BackdropFilterPage.routeName, context),
      menu.getNavItem(
          Icons.format_shapes, "ClipPath", ClipPathPage.routeName, context),
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
