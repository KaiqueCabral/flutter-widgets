import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/004_animated-container/animated-container.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/007_fade-transition/fade-transition.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/013_fade-in-image/fade-in-image.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/027_animated-builder/animated-builder.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/032_animated-list/animated-list.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/037_animated-icon/animated-icon.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/043_animated-switcher/animated-switcher.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/044_animated-positioned/animated-positioned.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/045_animated-padding/animated-padding.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/050_animated-opacity/animated-opacity.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/059_animation-cross-fade/animated-cross-fade.dart';
import 'package:flutter_widgets/widgets/AnimationMotion/064_tween-animation-builder/tween-animation-builder.dart';

class MenuAnimationMotion {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuAnimationMotion({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.view_carousel, "Animated Builder",
          AnimatedBuilderPage.routeName, context),
      menu.getNavItem(Icons.view_carousel, "Animated Container",
          AnimatedContainerPage.routeName, context),
      menu.getNavItem(Icons.view_carousel, "Animated Cross Fade",
          AnimatedcrossFadePage.routeName, context),
      menu.getNavItem(Icons.play_arrow, "Animated Icon",
          AnimatedIconPage.routeName, context),
      menu.getNavItem(Icons.line_style, "Animated List",
          AnimatedListPage.routeName, context),
      menu.getNavItem(Icons.photo_size_select_small, "Animated Padding",
          AnimatedPaddingPage.routeName, context),
      menu.getNavItem(Icons.swap_calls, "Animated Opacity",
          AnimatedOpacityPage.routeName, context),
      menu.getNavItem(Icons.swap_calls, "Animated Positioned",
          AnimatedPositionedPage.routeName, context),
      menu.getNavItem(Icons.swap_horizontal_circle, "Animated Switcher",
          AnimatedSwitcherPage.routeName, context),
      menu.getNavItem(Icons.image_aspect_ratio, "Fade In Image",
          FadeInImagePage.routeName, context),
      menu.getNavItem(
          Icons.mood, "Fade Transition", FadeTransitionPage.routeName, context),
      menu.getNavItem(Icons.movie_creation, "Tween Animation Builder",
          TweenAnimationBuilderPage.routeName, context),
    ];
  }
}
