import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Scrolling/009_page-view/page-view.dart';
import 'package:flutter_widgets/widgets/Scrolling/042_reordenable-list-view/reordenable-list-view.dart';
import 'package:flutter_widgets/widgets/Scrolling/060_draggable-scrollable-sheet/draggable-scrollable-sheet.dart';
import 'package:flutter_widgets/widgets/Scrolling/071_notification-listener/notification-listener.dart';

class MenuScrolling {
  final BuildContext context;
  final Menu menu;
  late List<Widget> subItems;

  MenuScrolling({required this.context, required this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(Icons.drag_handle, "Draggable Scrollable Sheet",
          DraggableScrollableSheetPage.routeName, context),
      menu.getNavItem(Icons.notifications, "Notification Listener",
          NotificationListenerPage.routeName, context),
      menu.getNavItem(
          Icons.pageview, "Page View", PageViewPage.routeName, context),
      menu.getNavItem(Icons.filter_list, "Reordenable ListView",
          ReordenableListViewPage.routeName, context),
    ];
  }
}
