import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SafeAreaPage extends StatefulWidget {
  static const String routeName = "/safe-area";

  @override
  _SafeAreaPageState createState() => _SafeAreaPageState();
}

class _SafeAreaPageState extends State<SafeAreaPage> {
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
        title: Text("Safe Area"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            sameText(
              "The thing with \"Safe Area\" is that the WIDGET was (basically) made for mobile, but you can use it on Web Apps (of course, that's the beauty of Flutter).",
            ),
            Divider(),
            sameText(
              "On mobile you can see that the APP won't reach the edge of the smartphone.",
            ),
            Divider(),
            sameText(
              "It is similar to \"padding\" and \"margin\" on HTML.",
            ),
            Divider(),
          ],
        ),
        bottom: true,
        top: true,
        left: true,
        right: true,
        minimum: EdgeInsets.all(50),
      ),
    );
  }

  Text sameText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    );
  }
}
