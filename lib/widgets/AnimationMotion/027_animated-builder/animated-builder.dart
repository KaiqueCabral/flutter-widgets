import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AnimatedBuilderPage extends StatefulWidget {
  static const String routeName = "/animated-builder";

  _AnimatedBuilderPage createState() => _AnimatedBuilderPage();
}

class _AnimatedBuilderPage extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      reverseDuration: Duration(seconds: 2),
      upperBound: 2,
    )..repeat(reverse: true);

    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    _controller.dispose();
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Builder"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.1415,
              child: child,
            );
          },
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
        ),
      ),
    );
  }
}
