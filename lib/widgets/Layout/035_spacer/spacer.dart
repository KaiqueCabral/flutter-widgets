import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class SpacerPage extends StatefulWidget {
  static const String routeName = "/spacer";

  @override
  _SpacerPageState createState() => _SpacerPageState();
}

class _SpacerPageState extends State<SpacerPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.banner)
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
        title: Text("Spacer"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 10, vertical: 55),
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Text(
                    "Using",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 3,
                ),
                Spacer(
                  flex: 4,
                ),
                Container(
                  color: Colors.red,
                  child: Text(
                    "Widget:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  color: Colors.red,
                  child: Text(
                    "Spacer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                ),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                finalContainer("Using"),
                finalContainer("Property:"),
                finalContainer("spaceAround"),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                finalContainer("Using"),
                finalContainer("Property:"),
                finalContainer("spaceAround"),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                finalContainer("Using"),
                finalContainer("Property:"),
                finalContainer("spaceAround"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container finalContainer(String text) {
    return Container(
      color: Colors.tealAccent,
      child: Text(text),
      padding: EdgeInsets.all(25),
    );
  }
}
