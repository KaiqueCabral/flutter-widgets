import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class TransformPage extends StatefulWidget {
  static const String routeName = "/transform";

  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
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
        title: Text("Transform"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.04)
              ..rotateX(3.14 / 20.0),
            alignment: FractionalOffset.center,
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
