import 'package:flutter/material.dart';
import 'package:widget_tests/shared/menu.dart';
import 'package:widget_tests/widgets/Scrolling/009_page-view/page-view.dart';
import 'package:widget_tests/widgets/Scrolling/042_reordenable-list-view/reordenable-list-view.dart';
import 'package:widget_tests/widgets/Scrolling/060_draggable-scrollable-sheet/draggable-scrollable-sheet.dart';
import 'package:widget_tests/widgets/Scrolling/071_notification-listener/notification-listener.dart';

class MenuScrolling {
  final BuildContext context;
  final Menu menu;
  List<Widget> subItems;

  MenuScrolling({this.context, this.menu}) {
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
