import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  static const String routeName = "/indexed-stack";

  _IndexedStackPage createState() => _IndexedStackPage();
}

class _IndexedStackPage extends State<IndexedStackPage> {
  int _indexStack = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indexed Stack"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            IndexedStack(
              index: _indexStack,
              sizing: StackFit.expand,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    "Channel 0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.orange,
                  child: Text(
                    "Channel 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Text(
                    "Channel 2",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 36,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  color: Colors.blue,
                  child: Text(
                    "Channel 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  "Like Flutter's website says, \"IndexedStack\" works like a TV." +
                      "\nYou can click on the buttons and the widgets will work like you are changing the TV channels."),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (int i = 0; i < 4; i++)
                  RaisedButton(
                    child: Text("$i"),
                    onPressed: () {
                      setState(() {
                        _indexStack = i;
                      });
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}