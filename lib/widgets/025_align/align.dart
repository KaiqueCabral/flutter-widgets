import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  static const String routeName = "/align";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Align"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 200.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 100.0,
                  width: 200.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 130.0,
                  width: 200.0,
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-1, -1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                      Align(
                        alignment: Alignment(
                          -1,
                          -1,
                        ),
                        child: Text(
                          "Alignment (-1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using ALIGNMENT: The X: 0 and Y: 0 is in the center of the Parent Widget.",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 130.0,
                  width: 200.0,
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(1, -1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                      Align(
                        alignment: Alignment(
                          1,
                          -1,
                        ),
                        child: Text(
                          "Alignment (1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                          "Using ALIGNMENT: The X: 0 and Y: 0 is in the center of the Parent Widget.")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 200.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 100.0,
                  width: 200.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 130.0,
                  width: 200.0,
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(
                          0,
                          0,
                        ),
                        child: Text(
                          "FractionalOffset (-1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using FRACTIONALOFFSET: The X: 0 and Y: 0 is in the TOP-LEFT of the Parent Widget.",
                      ),
                      Align(
                        alignment: FractionalOffset(0, 1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 130.0,
                  width: 200.0,
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(
                          0,
                          0,
                        ),
                        child: Text(
                          "FractionalOffset (1, 1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using FRACTIONALOFFSET: The X: 0 and Y: 0 is in the TOP-LEFT of the Parent Widget.",
                      ),
                      Align(
                        alignment: FractionalOffset(1, 1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
