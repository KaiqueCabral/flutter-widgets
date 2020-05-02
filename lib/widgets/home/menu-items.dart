import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/home/menu/accessibility.dart';
import 'package:flutter_widgets/widgets/home/menu/animationn-motion.dart';
import 'package:flutter_widgets/widgets/home/menu/assets-images-icons.dart';
import 'package:flutter_widgets/widgets/home/menu/async.dart';
import 'package:flutter_widgets/widgets/home/menu/basics.dart';
import 'package:flutter_widgets/widgets/home/menu/interaction-models.dart';
import 'package:flutter_widgets/widgets/home/menu/layout.dart';
import 'package:flutter_widgets/widgets/home/menu/material-components.dart';
import 'package:flutter_widgets/widgets/home/menu/painting-effects.dart';
import 'package:flutter_widgets/widgets/home/menu/scrolling.dart';
import 'package:flutter_widgets/widgets/home/menu/styling.dart';
import 'package:flutter_widgets/widgets/home/menu/text.dart';

class MenuItems extends StatefulWidget {
  @override
  _MenuItems createState() => _MenuItems();
}

class _MenuItems extends State<MenuItems> {
  Drawer getNavDrawer(BuildContext context) {
    var navItems = [
      Menu.appDrawerHeader(),
      Menu.getMenu(
        Icons.accessibility,
        "Accessibility",
        Colors.grey[900],
        MenuAccessibility(
          context: context,
          menu: Menu(colorItems: Colors.grey[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.movie,
        "Animation & Motion",
        Colors.red[500],
        MenuAnimationMotion(
          context: context,
          menu: Menu(colorItems: Colors.red[300]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.image,
        "Assets, Image & Icon",
        Colors.yellow[900],
        MenuAssetsImagesIcons(
          context: context,
          menu: Menu(colorItems: Colors.yellow[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.sync,
        "Async",
        Colors.deepOrange[900],
        MenuAsync(
          context: context,
          menu: Menu(colorItems: Colors.deepOrange[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.crop_square,
        "Basics",
        Colors.grey[900],
        MenuBasics(
          context: context,
          menu: Menu(colorItems: Colors.grey[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.person,
        "Interaction Models",
        Colors.brown[900],
        MenuInteractionModels(
          context: context,
          menu: Menu(colorItems: Colors.brown[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.layers,
        "Layout",
        Colors.indigo[900],
        MenuLayout(
          context: context,
          menu: Menu(colorItems: Colors.indigo[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.library_add,
        "Material Components",
        Colors.teal[900],
        MenuMaterialComponents(
          context: context,
          menu: Menu(colorItems: Colors.teal[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.format_paint,
        "Painting Effects",
        Colors.purple[900],
        MenuPaintingEffects(
          context: context,
          menu: Menu(colorItems: Colors.purple[700]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.settings_overscan,
        "Scrolling",
        Colors.amber[700],
        MenuScrolling(
          context: context,
          menu: Menu(colorItems: Colors.amber[500]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.style,
        "Styling",
        Colors.cyan[700],
        MenuStyling(
          context: context,
          menu: Menu(colorItems: Colors.cyan[500]),
        ).subItems,
      ),
      Menu.getMenu(
        Icons.text_fields,
        "Text",
        Colors.black,
        MenuText(
          context: context,
          menu: Menu(colorItems: Colors.black54),
        ).subItems,
      ),
      Menu.appAbout(),
    ];

    ListView listView = ListView(
      padding: EdgeInsets.zero,
      children: navItems,
    );

    return Drawer(
      child: listView,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getNavDrawer(context);
  }
}
