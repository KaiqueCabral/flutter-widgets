import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  static const String routeName = "/stack";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Container(
        color: Colors.red[100],
        padding: EdgeInsets.all(30),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue[500],
            ),
            Container(
              color: Colors.blue[400],
              margin: EdgeInsets.all(30),
            ),
            Container(
              color: Colors.blue[300],
              margin: EdgeInsets.all(60),
            ),
            Container(
              color: Colors.blue[200],
              margin: EdgeInsets.all(90),
            ),
            Container(
              color: Colors.blue[100],
              margin: EdgeInsets.all(120),
            ),
            Positioned(
              left: 130,
              top: 130,
              child: Text("Top Left"),
            ),
            Positioned(
              right: 130,
              top: 130,
              child: Text("Top Right"),
            ),
            Positioned(
              left: 130,
              bottom: 130,
              child: Text("Bottom Left"),
            ),
            Positioned(
              right: 130,
              bottom: 130,
              child: Text("Bottom Right"),
            ),
          ],
        ),
      ),
    );
  }
}
