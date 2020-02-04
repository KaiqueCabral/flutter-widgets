import 'package:flutter/material.dart';

class AnimatedIconPage extends StatefulWidget {
  static const String routeName = "/animated-icon";

  _AnimatedIconPage createState() => _AnimatedIconPage();
}

class _AnimatedIconPage extends State<AnimatedIconPage>
    with TickerProviderStateMixin {
  bool isPlaying = false;
  bool isMenuClosed = false;
  AnimationController _animationControllerPlay;
  AnimationController _animationControllerMenu;

  @override
  void initState() {
    super.initState();
    _animationControllerPlay = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationControllerMenu = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationControllerPlay.dispose();
    _animationControllerMenu.dispose();
    super.dispose();
  }

  _animatedIcon(String _semanticLabel, AnimatedIconData _theIcon, Color _color,
          AnimationController _animationController) =>
      AnimatedIcon(
        icon: _theIcon,
        color: _color,
        size: 50,
        progress: _animationController,
        semanticLabel: _semanticLabel,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icon"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 100,
              icon: _animatedIcon(
                "Animated Icon",
                AnimatedIcons.play_pause,
                Colors.red,
                _animationControllerPlay,
              ),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  isPlaying
                      ? _animationControllerPlay.forward()
                      : _animationControllerPlay.reverse();
                });
              },
            ),
            IconButton(
              iconSize: 100,
              icon: _animatedIcon(
                "Animated Icon",
                AnimatedIcons.close_menu,
                Colors.blue,
                _animationControllerMenu,
              ),
              onPressed: () {
                setState(() {
                  isMenuClosed = !isMenuClosed;
                  isMenuClosed
                      ? _animationControllerMenu.forward()
                      : _animationControllerMenu.reverse();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
