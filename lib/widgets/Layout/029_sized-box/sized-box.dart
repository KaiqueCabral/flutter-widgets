import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SizedBoxPage extends StatefulWidget {
  static const String routeName = "/sized-box";

  @override
  _SizedBoxPageState createState() => _SizedBoxPageState();
}

class _SizedBoxPageState extends State<SizedBoxPage> {
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
        title: Text("Sized Box"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
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
