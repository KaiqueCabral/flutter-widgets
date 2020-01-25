import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  static const String routeName = "/transform";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.04)
              ..rotateX(3.14 / 20.0),
            alignment: FractionalOffset.center,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
