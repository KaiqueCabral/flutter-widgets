import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AspectRatioPage extends StatefulWidget {
  static const String routeName = "/aspect-ratio";

  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.mediumRectangle)
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
        title: Text("Aspect Ratio"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            mutualAspectRatio(3, Colors.green),
            mutualAspectRatio(4, Colors.red),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.teal,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AspectRatio mutualAspectRatio(double aspectRatio, Color color) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        margin: EdgeInsets.all(20),
        color: color,
      ),
    );
  }
}
