import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class FittedBoxPage extends StatefulWidget {
  static const String routeName = "/fitted-box";

  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
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
        title: Text("Fitted Box"),
      ),
      body: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: <Widget>[
              container(Colors.deepPurple),
              container(Colors.deepOrange),
            ],
          ),
        ),
      ),
    );
  }

  Container container(Color color) {
    return Container(
      width: 1000.0, //Over the width and still working
      height: 1000.0, //Over the height and still working
      color: color,
      child: FittedBox(
        fit: BoxFit.contain, //Fill the whole thing with the image
        child: Image.asset(
          'assets/images/flutter-fade-in-image.jpg',
        ),
      ),
    );
  }
}
