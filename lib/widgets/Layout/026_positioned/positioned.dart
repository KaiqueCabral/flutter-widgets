import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PositionedPage extends StatefulWidget {
  static const String routeName = "/positioned";

  @override
  _PositionedPageState createState() => _PositionedPageState();
}

class _PositionedPageState extends State<PositionedPage> {
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
        title: Text("Positioned"),
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
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.red[300],
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue[300],
            ),
            flutterLogo(left: 0, top: 0),
            flutterLogo(right: 0, top: 0),
            flutterLogo(left: 0, bottom: 0),
            flutterLogo(right: 0, bottom: 0),
          ],
        ),
      ),
    );
  }

  Positioned flutterLogo(
      {double? left, double? top, double? right, double? bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.yellow[300],
        child: FlutterLogo(),
      ),
    );
  }
}
