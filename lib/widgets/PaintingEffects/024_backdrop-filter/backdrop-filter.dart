import 'dart:ui';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';
import 'package:flutter_widgets/shared/settings.dart';

class BackdropFilterPage extends StatefulWidget {
  static const String routeName = "/backdrop-filter";

  @override
  _BackdropFilterPageState createState() => _BackdropFilterPageState();
}

class _BackdropFilterPageState extends State<BackdropFilterPage> {
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
        title: Text("Backdrop Filter"),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            child: Image.network(
              "${Settings.apiURL}/images/landscape.jpg",
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 6,
              ),
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.grey.shade100.withOpacity(0.2),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
