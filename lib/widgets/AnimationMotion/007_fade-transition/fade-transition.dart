import 'package:flutter/material.dart';

class FadeTransitionPage extends StatefulWidget {
  static const String routeName = "/fade-transition";

  @override
  _FadeTransitionPage createState() => _FadeTransitionPage();
}

class _FadeTransitionPage extends State<FadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  CurvedAnimation _curveAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curveAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_curveAnimation);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    //This command is here to start the animation when the page starts
    //_animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Transition'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Icon(
            Icons.lightbulb_outline,
            color: Colors.lightGreen,
            size: 300,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            _animationController.reset();
            _animationController.forward();
          });
        },
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
