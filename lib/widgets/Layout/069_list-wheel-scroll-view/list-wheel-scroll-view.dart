import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListWheelScrollViewPage extends StatefulWidget {
  static const String routeName = "/list-wheel-scroll-view";

  @override
  _ListWheelScrollViewPageState createState() =>
      _ListWheelScrollViewPageState();
}

class _ListWheelScrollViewPageState extends State<ListWheelScrollViewPage> {
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.fullBanner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
      );

      _ad?.load();
    }
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Wheel Scroll View"),
      ),
      bottomSheet: (!kIsWeb)
          ? Container(
              child: AdWidget(ad: _ad!),
              height: _ad!.size.height.toDouble(),
            )
          : Container(
              height: 0,
              width: 0,
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
