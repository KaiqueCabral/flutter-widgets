import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  static const String routeName = "/animated-positioned";

  @override
  _AnimatedPositionedPage createState() => _AnimatedPositionedPage();
}

class _AnimatedPositionedPage extends State<AnimatedPositionedPage>
    with SingleTickerProviderStateMixin {
  double _verticalAlignment = 0;
  double _horizontalAlignment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.deepOrange[100],
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: RaisedButton(
              child: Text("Click Here!"),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: () {
                _animatePosition();
              },
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 3),
            bottom: _verticalAlignment,
            left: _horizontalAlignment,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 150,
              color: Colors.deepPurple[400],
            ),
          )
        ],
      ),
    );
  }

  void _animatePosition() {
    setState(() {
      _verticalAlignment = 250;
      _horizontalAlignment = MediaQuery.of(context).size.width * 0.4;
    });
  }
}
