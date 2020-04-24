import 'package:flutter/material.dart';

class ListWheelScrollViewPage extends StatelessWidget {
  static const String routeName = "/list-wheel-scroll-view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Wheel Scroll View"),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: ListWheelScrollView(
          children: List<Widget>.generate(
            20,
            (index) => Card(
              color: Colors.amber[100],
              child: Center(child: Text("Entry ${index + 1}")),
            ),
          ),
          itemExtent: 100,
          offAxisFraction: 0, //Min: -1 | Max: 1
        ),
      ),
    );
  }
}
