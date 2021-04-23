import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  static const String routeName = "/animated-positioned";

  @override
  _AnimatedPositionedPage createState() => _AnimatedPositionedPage();
}

class _AnimatedPositionedPage extends State<AnimatedPositionedPage>
    with SingleTickerProviderStateMixin {
  bool hasChanged = false;
  double _verticalAlignment = 130;
  double _horizontalAlignment = 30;
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
        title: Text("Animated Positioned"),
      ),
      backgroundColor: Colors.blue[100],
      bottomSheet: Container(
        color: Colors.blue[100],
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.9),
              child: ElevatedButton(
                child: Text("Click Here!"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[700],
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _animatePosition();
                },
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              bottom: _verticalAlignment,
              left: _horizontalAlignment,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 150,
                color: Colors.deepPurple[400],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _animatePosition() {
    setState(() {
      if (!hasChanged) {
        _verticalAlignment *= 2;
        _horizontalAlignment = (MediaQuery.of(context).size.width * 0.4) - 30;
      } else {
        _verticalAlignment /= 2;
        _horizontalAlignment = 30;
      }

      hasChanged = !hasChanged;
    });
  }
}
