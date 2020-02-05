import 'package:flutter/material.dart';

class AnimatedPaddingPage extends StatefulWidget {
  static const String routeName = "/animated-padding";

  _AnimatedPaddingPage createState() => _AnimatedPaddingPage();
}

class _AnimatedPaddingPage extends State<AnimatedPaddingPage> {
  var _padding = EdgeInsets.zero;
  void _changePadding() {
    setState(() {
      if (_padding.left == 100) {
        _padding = EdgeInsets.only(top: 100, bottom: 100);
      } else {
        _padding = EdgeInsets.only(left: 100, right: 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.red[600],
            onPressed: () {
              _changePadding();
            },
            child: Text(
              "Click Here!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 300.0,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: AnimatedPadding(
              padding: _padding,
              curve: Curves.ease,
              duration: Duration(seconds: 1),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
