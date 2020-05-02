import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AnimatedPositionedPage extends StatefulWidget {
  static const String routeName = "/animated-positioned";

  @override
  _AnimatedPositionedPage createState() => _AnimatedPositionedPage();
}

class _AnimatedPositionedPage extends State<AnimatedPositionedPage>
    with SingleTickerProviderStateMixin {
  bool hasChanged = false;
  double _verticalAlignment = 130;
  double _horizontalAlignment = 30;
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
        title: Text("Animated Positioned"),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.9),
              child: RaisedButton(
                child: Text("Click Here!"),
                color: Colors.red[700],
                textColor: Colors.white,
                onPressed: () {
                  _animatePosition();
                },
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              bottom: _verticalAlignment,
              left: _horizontalAlignment,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 150,
                color: Colors.deepPurple[400],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _animatePosition() {
    setState(() {
      if (!hasChanged) {
        _verticalAlignment *= 2;
        _horizontalAlignment = (MediaQuery.of(context).size.width * 0.4) - 30;
      } else {
        _verticalAlignment /= 2;
        _horizontalAlignment = 30;
      }

      hasChanged = !hasChanged;
    });
  }
}
