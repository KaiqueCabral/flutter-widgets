import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class PlaceHolderPage extends StatefulWidget {
  static const String routeName = "/place-holder";

  @override
  _PlaceHolderPageState createState() => _PlaceHolderPageState();
}

class _PlaceHolderPageState extends State<PlaceHolderPage> {
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
        title: Text("Place Holder"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width * .6,
              height: 25,
            ),
            Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width * .8,
              height: 50,
            ),
            Container(
              color: Colors.teal,
              width: MediaQuery.of(context).size.width * .9,
              height: 75,
            ),
            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 200,
              strokeWidth: 5,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
