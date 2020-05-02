import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AnimatedcrossFadePage extends StatefulWidget {
  static const String routeName = "/animated-cross-fade";

  @override
  _AnimatedcrossFadePageState createState() => _AnimatedcrossFadePageState();
}

class _AnimatedcrossFadePageState extends State<AnimatedcrossFadePage> {
  bool _first = true;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show(anchorType: AnchorType.top, anchorOffset: 90);
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
        title: Text("Animation Cross Fade"),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        alignment: Alignment.center,
        child: AnimatedCrossFade(
          duration: Duration(seconds: 2),
          firstChild: Container(
            alignment: Alignment.center,
            color: Colors.deepOrange[100],
            child: FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 200,
            ),
            width: 250,
            height: 250,
          ),
          secondChild: Container(
            alignment: Alignment.center,
            color: Colors.red[500],
            child: FlutterLogo(
              style: FlutterLogoStyle.stacked,
              size: 150.0,
              textColor: Colors.white,
            ),
            width: 250,
            height: 250,
          ),
          crossFadeState:
              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstCurve: Curves.easeIn,
          secondCurve: Curves.fastOutSlowIn,
          sizeCurve: Curves.bounceIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.transform,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
        onPressed: () {
          setState(() {
            _first = !_first;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
