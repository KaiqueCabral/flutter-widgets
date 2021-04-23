import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class PositionedPage extends StatefulWidget {
  static const String routeName = "/positioned";

  @override
  _PositionedPageState createState() => _PositionedPageState();
}

class _PositionedPageState extends State<PositionedPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
    //..load()
    //..show();
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
        title: Text("Positioned"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red[300],
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue[300],
            ),
            flutterLogo(left: 0, top: 0),
            flutterLogo(right: 0, top: 0),
            flutterLogo(left: 0, bottom: 0),
            flutterLogo(right: 0, bottom: 0),
          ],
        ),
      ),
    );
  }

  Positioned flutterLogo(
      {double left, double top, double right, double bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.yellow[300],
        child: FlutterLogo(),
      ),
    );
  }
}
