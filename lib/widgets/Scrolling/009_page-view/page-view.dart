import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
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
          RaisedButton(
            onPressed: () {
              pageController.animateToPage(
                2,
                duration: Duration(seconds: 1),
                curve: Curves.easeInCirc,
              );
            },
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
            onPressed: () {},
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          containerColor(
            "SWIPE to the left to see PageView working.",
            1,
            Colors.pink,
          ),
          containerColor(
            "SWIPE to the left/right to see PageView working.",
            2,
            Colors.cyan,
          ),
          containerColor(
            "SWIPE to the right to see PageView working.",
            3,
            Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
