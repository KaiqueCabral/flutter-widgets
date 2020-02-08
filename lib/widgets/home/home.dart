import 'package:flutter/material.dart';
import 'package:widget_tests/widgets/home/menu-items.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Use the menu to check the widgets"),
      ),
      drawer: MenuItems(),
    );
  }
}
