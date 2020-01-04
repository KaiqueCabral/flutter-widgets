import 'package:flutter/material.dart';

class SafeAreaPage extends StatelessWidget {
  static const String routeName = "/safe-area";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Safe Area")),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              "The thing with \"Safe Area\" is that the WIDGET was (basically) made for mobile, but you can use it on Web Apps (of course, that's the beauty of Flutter).",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify
            ),
            Divider(),
            Text(
              "On mobile you can see that the APP won't reach the edge of the smartphone.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify
            ),
            Divider(),
            Text(
              "It is similar to \"padding\" and \"margin\" on HTML.",
              style: TextStyle(fontSize:16),
              textAlign: TextAlign.justify,
            )
          ]),
          bottom: true,
          top: true,
          left: true,
          right: true,
          minimum: EdgeInsets.all(50),
        ));
  }
}
