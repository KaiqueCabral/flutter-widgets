import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonPage extends StatefulWidget {
  static const String routeName = "/floating-action-button";
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FloatingActionButtonPage({this.onPressed, this.tooltip, this.icon});

  @override
  _FloatingActionButtonPage createState() => _FloatingActionButtonPage();
}

class _FloatingActionButtonPage extends State<FloatingActionButtonPage>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.00, curve: _curve),
      ),
    );
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.75, curve: _curve),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    isOpened = !isOpened;
  }

  Widget add() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }

  Widget image() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: "Image",
        child: Icon(Icons.image),
      ),
    );
  }

  Widget inbox() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: "Inbox",
        child: Icon(Icons.inbox),
      ),
    );
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: "Toggle",
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Text("Click here! >>> ", style: 
        TextStyle(fontSize: 24, color: Colors.grey),),
        padding: EdgeInsets.all(25),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: add(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 2.0, 0.0),
            child: image(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 1.0, 0.0),
            child: inbox(),
          ),
          toggle()
        ],
      ),
    );
  }
}
