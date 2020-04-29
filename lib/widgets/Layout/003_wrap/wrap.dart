import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  static const String routeName = "/wrap";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wrap")),
      body: SingleChildScrollView(
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
              height: 110,
              padding: EdgeInsets.all(20),
            ),
            container(Colors.lightBlueAccent),
            container(Colors.lightBlueAccent),
            container(Colors.redAccent),
            container(Colors.redAccent),
            container(Colors.yellowAccent),
            container(Colors.yellowAccent),
            container(Colors.greenAccent),
            container(Colors.greenAccent),
            container(Colors.orangeAccent),
            container(Colors.orangeAccent),
          ],
        ),
      ),
    );
  }

  Container container(Color color) {
    return Container(
      color: color,
      width: 220,
      height: 100,
    );
  }
}
