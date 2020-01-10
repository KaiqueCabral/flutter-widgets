import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  static const String routeName = "/expanded";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded")),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  child: SafeArea(
                    child: Center(
                      child: Text(
                        "Colors.blue, height: 125, width: 400 (fixed values)\n\n" +
                            "Change the \"height\" property to \"50\", for example.\n" +
                            "If you do so, the second and third box will expand dynamically.",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    minimum: EdgeInsets.all(10),
                  ),
                  color: Colors.blue,
                  height: 125,
                  width: 400),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                        "This Container will expand and fit in the available space (vertically). It's expanding dynamically.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Arial",
                            color: Colors.white)),
                  ),
                  color: Colors.deepOrange,
                  width: 400,
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: SafeArea(
                      child: Text(
                        "This Container will expand and fit in the available space (vertically).\n\n" +
                            "- It's almost the same of the second box.\n" +
                            "- This Container is using \"Safe Area\" widget.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Arial"),
                      ),
                      minimum: EdgeInsets.all(20),
                    ),
                  ),
                  color: Colors.green,
                  width: 400,
                ),
              ),
              Container(
                child: SafeArea(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Text("Flex 1"),
                          ),
                          color: Colors.white38,
                          height: 100,
                        ),
                        flex: 1,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                              "This Container will NOT expand (fixed values).\n" +
                                  "It's not inside of an Expanded Widget, so the Container will use its fixed values.",
                              textAlign: TextAlign.left),
                        ),
                        color: Colors.white60,
                        height: 100,
                        width: 205,
                        padding: EdgeInsets.all(10),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Center(
                            child: Text("Flex 2"),
                          ),
                          color: Colors.white,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  minimum: EdgeInsets.all(10),
                ),
                color: Colors.amber,
                height: 120,
                width: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
