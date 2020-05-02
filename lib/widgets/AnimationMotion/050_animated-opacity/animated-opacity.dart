import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AnimatedOpacityPage extends StatefulWidget {
  static const String routeName = "/animated-opacity";

  _AnimatedOpacityPage createState() => _AnimatedOpacityPage();
}

class _AnimatedOpacityPage extends State<AnimatedOpacityPage> {
  double opacityLevel = 1.0;
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

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
      ),
      body: Container(
        color: Colors.orange[100],
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            RaisedButton(
              child: Text('Fade Logo'),
              onPressed: _changeOpacity,
              color: Colors.red,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 105, //Banner Ad
            ),
          ],
        ),
      ),
    );
  }
}
