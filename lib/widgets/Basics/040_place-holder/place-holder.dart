import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PlaceHolderPage extends StatefulWidget {
  static const String routeName = "/place-holder";

  @override
  _PlaceHolderPageState createState() => _PlaceHolderPageState();
}

class _PlaceHolderPageState extends State<PlaceHolderPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.largeBanner,
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
        title: Text("Place Holder"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
        margin: const EdgeInsets.only(top: 10),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width * .6,
              height: 25,
            ),
            Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width * .8,
              height: 50,
            ),
            Container(
              color: Colors.teal,
              width: MediaQuery.of(context).size.width * .9,
              height: 75,
            ),
            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 200,
              strokeWidth: 5,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
