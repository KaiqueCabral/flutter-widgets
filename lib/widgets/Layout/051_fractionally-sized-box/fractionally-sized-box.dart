import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FractionallySizedBoxPage extends StatefulWidget {
  static const String routeName = "/fractionally-sized-box";

  @override
  _FractionallySizedBoxPageState createState() =>
      _FractionallySizedBoxPageState();
}

class _FractionallySizedBoxPageState extends State<FractionallySizedBoxPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: AdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    _ad.load();
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
        title: Text("Fractionally Sized Box"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
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
