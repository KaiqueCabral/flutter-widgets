import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class ConstrainedBoxPage extends StatefulWidget {
  static const String routeName = "/constrained-box";

  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
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
        title: Text("Constrained Box"),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text("Using Constrained Box with MaxWidth"),
              ),
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.red,
              child: Text(
                "Using the same properties, but not with Constrained Box",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
