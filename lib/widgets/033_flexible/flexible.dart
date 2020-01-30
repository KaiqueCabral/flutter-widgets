import 'package:flutter/material.dart';

class FlexiblePage extends StatelessWidget {
  static const String routeName = "/flexible";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible"),
      ),
      body: Container(
        color: Colors.deepOrange[200],
        child: Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                color: Colors.teal[100],
                child: Row(
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.deepPurple,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "A",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "B",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.green[100],
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "D",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    color: Colors.green[300],
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "E",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "F",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue[100],
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "G",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
