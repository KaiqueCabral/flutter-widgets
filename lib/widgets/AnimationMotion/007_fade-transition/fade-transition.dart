import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class FadeTransitionPage extends StatefulWidget {
  static const String routeName = "/fade-transition";

  @override
  _FadeTransitionPage createState() => _FadeTransitionPage();
}

class _FadeTransitionPage extends State<FadeTransitionPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  CurvedAnimation _curvedAnimation;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_curvedAnimation);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    //This command is here to start the animation when the page starts
    //_animationController.forward();

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show(anchorType: AnchorType.top, anchorOffset: 90);
  }

  @override
  void dispose() {
    _animationController.dispose();
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Transition'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FadeTransition(
            opacity: _animation,
            child: Icon(
              Icons.lightbulb_outline,
              color: Colors.lightGreen,
              size: 200,
            ),
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
