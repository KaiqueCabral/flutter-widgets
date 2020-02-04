import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  static const String routeName = "/aspect-ratio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aspect Ratio"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3,
              child: Container(
                margin: EdgeInsets.all(20),
                color: Colors.green,
              ),
            ),
            AspectRatio(
              aspectRatio: 4,
              child: Container(
                color: Colors.red,
                margin: EdgeInsets.all(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.teal,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
