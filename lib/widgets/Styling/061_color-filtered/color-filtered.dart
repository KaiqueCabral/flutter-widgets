import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ColorFilteredPage extends StatefulWidget {
  static const String routeName = "/color-filtered";

  @override
  _ColorFilteredPageState createState() => _ColorFilteredPageState();
}

class _ColorFilteredPageState extends State<ColorFilteredPage> {
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
        title: Text("Color Filtered"),
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
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ColorFiltered(
                    child:
                        Image.asset("assets/images/flutter-fade-in-image.jpg"),
                    colorFilter: ColorFilter.mode(
                      Colors.red,
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
