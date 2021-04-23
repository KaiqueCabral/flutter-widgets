import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  static const String routeName = "/animated-opacity";

  _AnimatedOpacityPage createState() => _AnimatedOpacityPage();
}

class _AnimatedOpacityPage extends State<AnimatedOpacityPage> {
  double opacityLevel = 1.0;
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

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        width: MediaQuery.of(context).size.width,
        height: _ad.size.height.toDouble(),
        color: Colors.orange[100],
      ),
      body: Container(
        color: Colors.orange[100],
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: Duration(seconds: 1),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            ElevatedButton(
              child: Text('Fade Logo'),
              onPressed: _changeOpacity,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 105, //Banner Ad
            ),
          ],
        ),
      ),
    );
  }
}
