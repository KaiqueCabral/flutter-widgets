import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  static const String routeName = "/draggable";

  _DraggablePage createState() => _DraggablePage();
}

class _DraggablePage extends State<DraggablePage> {
  int _radio = 0, _tv = 0, _star = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Draggable(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow[300],
                      alignment: Alignment.center,
                      child: Icon(Icons.radio),
                    ),
                    feedback: Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                      alignment: Alignment.center,
                      child: Icon(Icons.radio),
                    ),
                    data: "Radio",
                  ),
                ),
                Expanded(
                  child: Draggable(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange[300],
                      alignment: Alignment.center,
                      child: Icon(Icons.tv),
                    ),
                    feedback: Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: Icon(Icons.tv),
                    ),
                    data: "TV",
                  ),
                ),
                Expanded(
                  child: Draggable(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red[300],
                      alignment: Alignment.center,
                      child: Icon(Icons.star),
                    ),
                    feedback: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Icon(Icons.star),
                    ),
                    data: "Star",
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _radio.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _tv.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      _star.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 50, top: 50),
                          child: Text(
                            "TV",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return (data == "TV");
                    },
                    onAccept: (data) {
                      setState(() {
                        _tv++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 50, top: 50),
                          child: Text(
                            "Star",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return (data == "Star");
                    },
                    onAccept: (data) {
                      setState(() {
                        _star++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 50, top: 50),
                          child: Text(
                            "Radio",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return (data == "Radio");
                    },
                    onAccept: (data) {
                      setState(() {
                        _radio++;
                      });
                    },
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
