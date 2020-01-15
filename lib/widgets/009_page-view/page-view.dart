import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  static const String routeName = "/page-view";

  Widget containerColor(String _text, int _pageNumber, Color _color) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                _text,
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "This is PAGE " + _pageNumber.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      color: _color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.swap_horiz,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: PageView(
        children: <Widget>[
          containerColor(
              "SWIPE to the left to see PageView working.", 1, Colors.pink),
          containerColor("SWIPE to the left/right to see PageView working.", 2,
              Colors.cyan),
          containerColor("SWIPE to the right to see PageView working.", 3,
              Colors.deepPurple),
        ],
      ),
    );
  }
}
