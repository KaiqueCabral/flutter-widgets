import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BackdropFilterPage extends StatefulWidget {
  static const String routeName = "/backdrop-filter";

  @override
  _BackdropFilterPageState createState() => _BackdropFilterPageState();
}

class _BackdropFilterPageState extends State<BackdropFilterPage> {
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
        title: Text("Backdrop Filter"),
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
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            child: Image.network(
              "https://picsum.photos/seed/picsum/600/300",
            ),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 6,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100.withOpacity(0.2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
