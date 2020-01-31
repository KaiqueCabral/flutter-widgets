import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  static const String routeName = "/wrap";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Wrap")),
        body: SafeArea(
            minimum: EdgeInsets.all(15),
            child: Container(
                alignment: Alignment.topCenter,
                child: Wrap(
                  spacing: 10.0, // gap between adjacent chips
                  runSpacing: 10.0, // gap between lines
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Wrap works like a Row, but with this Widget the elements will NOT reach the edge.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.lightBlue,
                      width: 450,
                      height: 100,
                      padding: EdgeInsets.all(20),
                    ),
                    Container(
                        color: Colors.lightBlueAccent, width: 220, height: 100),
                    Container(
                        color: Colors.lightBlueAccent, width: 220, height: 100),
                    Container(color: Colors.redAccent, width: 220, height: 100),
                    Container(color: Colors.redAccent, width: 220, height: 100),
                    Container(
                        color: Colors.yellowAccent, width: 220, height: 100),
                    Container(
                        color: Colors.yellowAccent, width: 220, height: 100),
                    Container(
                        color: Colors.greenAccent, width: 220, height: 100),
                    Container(
                        color: Colors.greenAccent, width: 220, height: 100),
                    Container(
                        color: Colors.orangeAccent, width: 220, height: 100),
                    Container(
                        color: Colors.orangeAccent, width: 220, height: 100)
                  ],
                ))));
  }
}
