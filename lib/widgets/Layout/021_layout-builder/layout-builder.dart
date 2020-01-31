import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  static const String routeName = "/layout-builder";

  _text(double maxHeight, double maxWidth) => Text(
        "Height: " +
            maxHeight.roundToDouble().toString() +
            "\n"
                "Width: " +
            maxWidth.roundToDouble().toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Center(
              child: Container(
                child: Center(
                  child: _text(
                    constraints.maxHeight,
                    constraints.maxWidth,
                  ),
                ),
                //alignment: Alignment.center,
                color: Colors.blueAccent,
                height: constraints.maxHeight * 0.9,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: _text(
                  constraints.maxHeight,
                  constraints.maxWidth,
                ),
                color: Colors.blueAccent,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          }
        },
      ),
    );
  }
}
