import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ConstrainedBoxPage extends StatefulWidget {
  static const String routeName = "/constrained-box";

  @override
  _ConstrainedBoxPageState createState() => _ConstrainedBoxPageState();
}

class _ConstrainedBoxPageState extends State<ConstrainedBoxPage> {
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
        title: Text("Constrained Box"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text("Using Constrained Box with MaxWidth"),
              ),
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(30),
              color: Colors.red,
              child: Text(
                "Using the same properties, but not with Constrained Box",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
