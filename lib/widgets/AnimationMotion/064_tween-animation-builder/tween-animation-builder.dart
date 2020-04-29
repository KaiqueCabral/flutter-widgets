import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  static const String routeName = "/tween-animation-builder";
  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  Color finalColor = Colors.red[900];
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation Builder"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Click on icon below to see the animation:"),
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.red[50], end: finalColor),
              duration: Duration(seconds: 2),
              curve: Curves.easeInCirc,
              builder: (BuildContext context, Color _color, Widget child) {
                return IconButton(
                  icon: child,
                  iconSize: 100.0,
                  color: _color,
                  onPressed: () {
                    setState(() => finalColor = Colors.blue[900]);
                  },
                );
              },
              child: Icon(Icons.aspect_ratio),
            ),
          ],
        ),
      ),
    );
  }
}
