import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class LimitedBoxPage extends StatefulWidget {
  static const String routeName = "/limited-box";

  @override
  _LimitedBoxPageState createState() => _LimitedBoxPageState();
}

class _LimitedBoxPageState extends State<LimitedBoxPage> {
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
        title: Text("Limited Box"),
      ),
      body: ListView(
        children: List.generate(
          10,
          (index) => LimitedBox(
            maxHeight: 150,
            child: Container(
              color: Colors.red[(index + 1) * 100],
            ),
          ),
        ),
      ),
    );
  }
}
