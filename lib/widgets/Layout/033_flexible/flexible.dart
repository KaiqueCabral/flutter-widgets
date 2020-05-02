import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class FlexiblePage extends StatefulWidget {
  static const String routeName = "/flexible";

  @override
  _FlexiblePageState createState() => _FlexiblePageState();
}

class _FlexiblePageState extends State<FlexiblePage> {
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
        title: Text("Flexible"),
      ),
      body: Container(
        color: Colors.deepOrange[200],
        padding: EdgeInsets.only(bottom: 55),
        child: Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                color: Colors.teal[100],
                child: Row(
                  children: <Widget>[
                    flexibleInside(Colors.deepPurple, "A"),
                    flexibleInside(Colors.red, "B"),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: <Widget>[
                  flexibleInside(Colors.teal, "D"),
                  Container(
                    width: 200,
                    color: Colors.green[300],
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "E",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  flexibleInside(Colors.green, "F"),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue[100],
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "G",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Flexible flexibleInside(Color color, String text) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        color: color,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
