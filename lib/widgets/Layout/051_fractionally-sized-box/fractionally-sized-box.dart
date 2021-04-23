import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  static const String routeName = "/fractionally-sized-box";

  @override
  _FractionallySizedBoxPageState createState() =>
      _FractionallySizedBoxPageState();
}

class _FractionallySizedBoxPageState extends State<FractionallySizedBoxPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.banner)
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
        title: Text("Fractionally Sized Box"),
      ),
      body: Container(
        color: Colors.amber[100],
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.7, //70% of the Full Width
          heightFactor: 0.7, //70% of the Full Height
          child: Container(
            color: Colors.teal[400],
          ),
        ),
      ),
    );
  }
}
