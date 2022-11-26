import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/menu.dart';
import 'package:flutter_widgets/widgets/Packages/085_url_launcher/url_launcher.page.dart';
import 'package:flutter_widgets/widgets/Packages/086_sqflite/sqflite.page.dart';
import 'package:flutter_widgets/widgets/Packages/090_location/location.dart';

class MenuPackages {
  final BuildContext context;
  final Menu menu;
  late List<Widget> subItems;

  MenuPackages({required this.context, required this.menu}) {
    subItems = <Widget>[
      menu.getNavItem(
          Icons.data_usage, "SQLite", SQLitePage.routeName, context),
      menu.getNavItem(
          Icons.data_usage, "URL Launcher", URLLauncherPage.routeName, context),
      menu.getNavItem(
          Icons.map, "Maps", LocationPackagePage.routeName, context),
    ];
  }
}
