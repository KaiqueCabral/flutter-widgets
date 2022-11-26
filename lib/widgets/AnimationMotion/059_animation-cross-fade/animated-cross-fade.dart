import 'package:flutter/foundation.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AnimatedcrossFadePage extends StatefulWidget {
  static const String routeName = "/animated-cross-fade";

  @override
  _AnimatedcrossFadePageState createState() => _AnimatedcrossFadePageState();
}

class _AnimatedcrossFadePageState extends State<AnimatedcrossFadePage> {
  bool _first = true;
  BannerAd? _ad;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _ad = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.largeBanner,
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
        title: Text("Animation Cross Fade"),
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Column(
        children: [
          (!kIsWeb)
              ? Container(
                  child: AdWidget(ad: _ad!),
                  width: MediaQuery.of(context).size.width,
                  height: _ad!.size.height.toDouble(),
                  margin: const EdgeInsets.only(top: 10),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: AnimatedCrossFade(
                duration: Duration(seconds: 2),
                firstChild: Container(
                  alignment: Alignment.center,
                  color: Colors.deepOrange[100],
                  child: FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 200,
                  ),
                  width: 250,
                  height: 250,
                ),
                secondChild: Container(
                  alignment: Alignment.center,
                  color: Colors.red[500],
                  child: FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                    size: 150.0,
                    textColor: Colors.white,
                  ),
                  width: 250,
                  height: 250,
                ),
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstCurve: Curves.easeIn,
                secondCurve: Curves.fastOutSlowIn,
                sizeCurve: Curves.bounceIn,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.transform,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[900],
        onPressed: () {
          setState(() {
            _first = !_first;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
