import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  static const String routeName = "/animated-builder";

  _AnimatedBuilderPage createState() => _AnimatedBuilderPage();
}

class _AnimatedBuilderPage extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      reverseDuration: Duration(seconds: 2),
      upperBound: 2,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Builder"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: AnimatedBuilder(
          animation: _controller,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Animted\nBuilder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.1415,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
