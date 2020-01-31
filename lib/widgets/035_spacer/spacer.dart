import 'package:flutter/material.dart';

class SpacerPage extends StatelessWidget {
  static const String routeName = "/spacer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spacer"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Text(
                    "Using",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(25),
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Spacer(
                  flex: 4,
                ),
                Container(
                  color: Colors.red,
                  child: Text(
                    "Widget:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(25),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  color: Colors.red,
                  child: Text(
                    "Spacer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(25),
                ),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.tealAccent,
                  child: Text("Using"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("Property:"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("spaceAround"),
                  padding: EdgeInsets.all(25),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Colors.tealAccent,
                  child: Text("Using"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("Property:"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("spaceBetween"),
                  padding: EdgeInsets.all(25),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.tealAccent,
                  child: Text("Using"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("Property:"),
                  padding: EdgeInsets.all(25),
                ),
                Container(
                  color: Colors.tealAccent,
                  child: Text("spaceAround"),
                  padding: EdgeInsets.all(25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
