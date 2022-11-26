import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class StackPage extends StatefulWidget {
  static const String routeName = "/stack";

  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
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
        title: Text("Stack"),
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
        color: Colors.red[100],
        padding: EdgeInsets.all(55),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue[500],
            ),
            Container(
              color: Colors.blue[400],
              margin: EdgeInsets.all(30),
            ),
            Container(
              color: Colors.blue[300],
              margin: EdgeInsets.all(60),
            ),
            Container(
              color: Colors.blue[200],
              margin: EdgeInsets.all(90),
            ),
            Container(
              color: Colors.blue[100],
              margin: EdgeInsets.all(120),
            ),
            positionedText("Top Left", top: 130, left: 130),
            positionedText("Top Right", top: 130, right: 130),
            positionedText("Bottom Left", bottom: 130, left: 130),
            positionedText("Bottom Right", bottom: 130, right: 130),
          ],
        ),
      ),
    );
  }

  Positioned positionedText(String text,
      {double? left, double? top, double? right, double? bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Text(text),
    );
  }
}
