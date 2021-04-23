import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingPage extends StatefulWidget {
  static const String routeName = "/animated-padding";

  _AnimatedPaddingPage createState() => _AnimatedPaddingPage();
}

class _AnimatedPaddingPage extends State<AnimatedPaddingPage> {
  EdgeInsets _padding = EdgeInsets.zero;
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

  void _changePadding() {
    setState(() {
      if (_padding.left == 100) {
        _padding = EdgeInsets.only(top: 100, bottom: 100);
      } else {
        _padding = EdgeInsets.only(left: 100, right: 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        width: MediaQuery.of(context).size.width,
        height: _ad.size.height.toDouble(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _changePadding();
            },
            child: Text("Click Here!"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red[600],
              textStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: AnimatedPadding(
              padding: _padding,
              curve: Curves.ease,
              duration: Duration(seconds: 1),
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 55,
          ),
        ],
      ),
    );
  }
}
