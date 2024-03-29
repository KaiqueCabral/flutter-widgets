import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LayoutBuilderPage extends StatefulWidget {
  static const String routeName = "/layout-builder";

  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
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

  _text(double maxHeight, double maxWidth) => Text(
        "Height: ${maxHeight.roundToDouble()}\n"
        "Width: ${maxWidth.roundToDouble()}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Center(
              child: Container(
                child: Center(
                  child: _text(
                    constraints.maxHeight,
                    constraints.maxWidth,
                  ),
                ),
                //alignment: Alignment.center,
                color: Colors.blueAccent,
                height: constraints.maxHeight * 0.9,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          } else {
            return Center(
              child: Container(
                child: _text(
                  constraints.maxHeight,
                  constraints.maxWidth,
                ),
                color: Colors.blueAccent,
                width: constraints.maxWidth * 0.9,
                padding: EdgeInsets.all(20),
              ),
            );
          }
        },
      ),
    );
  }
}
