import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class FittedBoxPage extends StatefulWidget {
  static const String routeName = "/fitted-box";

  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
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
        title: Text("Fitted Box"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: <Widget>[
              container(Colors.deepPurple),
              container(Colors.deepOrange),
            ],
          ),
        ),
      ),
    );
  }

  Container container(Color color) {
    return Container(
      width: 1000.0, //Over the width and still working
      height: 1000.0, //Over the height and still working
      color: color,
      child: FittedBox(
        fit: BoxFit.contain, //Fill the whole thing with the image
        child: Image.asset(
          'assets/images/flutter-fade-in-image.jpg',
        ),
      ),
    );
  }
}
