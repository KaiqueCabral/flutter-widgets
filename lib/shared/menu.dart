import 'package:flutter/material.dart';

class Menu {
  final Color colorItems;
  Menu({this.colorItems});

  static ExpansionTile getMenu(
      IconData icon, String title, Color color, List<Widget> subItems) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 16.0),
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      children: subItems,
    );
  }

  ListTile getNavItem(
      IconData icon, String title, String routeName, BuildContext context) {
    var colorItem =
        colorItems != null ? colorItems : Theme.of(context).primaryColor;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
      leading: Icon(
        icon,
        color: colorItem,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  static DrawerHeader appDrawerHeader() {
    return DrawerHeader(
      child: Text(
        "Olá, Kaique!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }

  static AboutListTile appAbout() {
    return AboutListTile(
      child: Text("About"),
      applicationName: "App based on \"Widget of the Week\",",
      applicationVersion: "v1.0.0",
      applicationIcon: Icon(Icons.widgets),
      icon: Icon(Icons.info),
    );
  }
}
