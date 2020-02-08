import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatelessWidget {
  static const String routeName = "/fractionally-sized-box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fractionally Sized Box"),
      ),
      body: Container(
        color: Colors.amber[100],
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.8, //80% of the Full Width
          heightFactor: 0.8, //80% of the Full Height
          child: Container(
            color: Colors.teal[400],
          ),
        ),
      ),
    );
  }
}
