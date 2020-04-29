import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class ListWheelScrollViewPage extends StatefulWidget {
  static const String routeName = "/list-wheel-scroll-view";

  @override
  _ListWheelScrollViewPageState createState() =>
      _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {
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
        title: Text("List Wheel Scroll View"),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: ListWheelScrollView(
          children: List<Widget>.generate(
            20,
            (index) => Card(
              color: Colors.amber[100],
              child: Center(child: Text("Entry ${index + 1}")),
            ),
          ),
          itemExtent: 100,
          offAxisFraction: 0, //Min: -1 | Max: 1
        ),
      ),
    );
  }
}
