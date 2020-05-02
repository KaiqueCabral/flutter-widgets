import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class SizedBoxPage extends StatefulWidget {
  static const String routeName = "/sized-box";

  @override
  _SizedBoxPageState createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
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
      appBar: AppBar(title: Text("Sized Box")),
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 300.0,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Sized Box!'),
            ),
          ),
        ),
      ),
    );
  }
}
