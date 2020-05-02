import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

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
  BannerAd bannerAd;

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

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.mediumRectangle)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    _animationControllerPlay.dispose();
    _animationControllerMenu.dispose();
    bannerAd?.dispose();
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
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
