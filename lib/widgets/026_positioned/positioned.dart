import 'package:flutter/material.dart';

class PositionedPage extends StatelessWidget {
  static const String routeName = "/positioned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Positioned"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red[300],
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue[300],
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.yellow[300],
                child: FlutterLogo(),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.yellow[300],
                child: FlutterLogo(),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.yellow[300],
                child: FlutterLogo(),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 75,
                height: 75,
                color: Colors.yellow[300],
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
