import 'package:flutter/material.dart';

class ConstrainedBoxPage extends StatelessWidget {
  static const String routeName = "/constrained-box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Constrained Box"),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text("Using Constrained Box with MaxWidth"),
              ),
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.red,
              child: Text(
                "Using the same properties, but not with Constrained Box",
              ),
            ),
          ],
        ),
      ),
    );
  }
}