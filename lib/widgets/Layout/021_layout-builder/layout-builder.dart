import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class LayoutBuilderPage extends StatefulWidget {
  static const String routeName = "/layout-builder";

  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
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

  _text(double maxHeight, double maxWidth) => Text(
        "Height: ${maxHeight.roundToDouble()}\n"
        "Width: ${maxWidth.roundToDouble()}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Center(
              child: Container(
                child: Center(
                  child: _text(
                    constraints.maxHeight,
                    constraints.maxWidth,
                  ),
                ),
                //alignment: Alignment.center,
                color: Colors.blueAccent,
                height: constraints.maxHeight * 0.9,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: _text(
                  constraints.maxHeight,
                  constraints.maxWidth,
                ),
                color: Colors.blueAccent,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          }
        },
      ),
    );
  }
}
