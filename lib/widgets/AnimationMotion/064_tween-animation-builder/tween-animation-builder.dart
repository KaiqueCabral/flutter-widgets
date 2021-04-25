import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  static const String routeName = "/tween-animation-builder";
  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  Color finalColor = Colors.red[900];
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
        title: Text("Tween Animation Builder"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Click on icon below to see the animation:"),
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.red[50], end: finalColor),
              duration: Duration(seconds: 2),
              curve: Curves.easeInCirc,
              builder: (BuildContext context, Color _color, Widget child) {
                return IconButton(
                  icon: child,
                  iconSize: 100.0,
                  color: _color,
                  onPressed: () {
                    setState(() => finalColor = Colors.blue[900]);
                  },
                );
              },
              child: Icon(Icons.aspect_ratio),
            ),
          ],
        ),
      ),
    );
  }
}
