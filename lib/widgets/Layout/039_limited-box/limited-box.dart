import 'package:flutter/material.dart';

class LimitedBoxPage extends StatelessWidget {
  static const String routeName = "/limited-box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Limited Box"),
      ),
      body: ListView(
        children: <Widget>[
          for (int i = 1; i < 10; i++)
            LimitedBox(
              maxHeight: 150,
              child: Container(
                color: Colors.red[i * 100],
              ),
            ),
        ],
      ),
    );
  }
}
