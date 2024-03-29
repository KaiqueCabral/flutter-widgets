import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PaddingPage extends StatefulWidget {
  static const String routeName = "/padding";

  @override
  _PaddingPageState createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
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
        title: Text("Padding"),
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 55.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            expandedContainer(
              Colors.blue[700]!,
              const EdgeInsets.all(10.0),
              1,
              "Using \".all()\"",
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  expandedContainer(
                    Colors.blueAccent,
                    const EdgeInsets.fromLTRB(
                      10.0,
                      10.0,
                      10.0,
                      10.0,
                    ),
                    1,
                    "Using \".fromLTRB()\"",
                  ),
                  expandedContainer(
                    Colors.amber,
                    const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    1,
                    "Using \".only()\"",
                  ),
                  expandedContainer(
                    Colors.grey,
                    const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    1,
                    "Using \".symmetric()\"",
                  )
                ],
              ),
            ),
            expandedContainer(
              Colors.lightBlue,
              EdgeInsetsDirectional.fromSTEB(
                0,
                10.0,
                10.0,
                10.0,
              ),
              1,
              "Using \".fromSTEB()\"",
            )
          ],
        ),
      ),
    );
  }

  Expanded expandedContainer(
      Color color, EdgeInsetsGeometry padding, int flex, String text) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: padding,
        child: Container(
          color: color,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
