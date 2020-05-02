import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/InteractionModels/017_hero/hero.dart';
import 'package:flutter_widgets/widgets/InteractionModels/022_absorb-pointer/absorb-pointer.dart';
import 'package:flutter_widgets/widgets/InteractionModels/028_dismissible/dismissible.dart';
import 'package:flutter_widgets/widgets/InteractionModels/031_draggable/draggable.dart';
import 'package:flutter_widgets/widgets/InteractionModels/062_toggle-buttons/toggle-buttons.dart';
import 'package:flutter_widgets/widgets/InteractionModels/063_cupertino-action-sheet/cupertino-action-sheet.dart';

class MenuInteractionModels {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuInteractionModels({this.context, this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.mouse, "Absorb Pointer", AbsorbPointerPage.routeName, context),
      menu.getNavItem(Icons.menu, "Cupertino Action Sheet",
          CupertinoActionSheetPage.routeName, context),
      menu.getNavItem(
          Icons.arrow_left, "Dismissible", DismissiblePage.routeName, context),
      menu.getNavItem(
          Icons.drag_handle, "Draggable", DraggablePage.routeName, context),
      menu.getNavItem(
          Icons.transit_enterexit, "Hero", HeroPage.routeName, context),
      menu.getNavItem(
          Icons.sync, "Toggle Buttons", ToggleButtonsPage.routeName, context),
    ];
  }
}
