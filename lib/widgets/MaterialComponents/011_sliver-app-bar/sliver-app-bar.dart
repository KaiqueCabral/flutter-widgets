import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SliverAppBarPage extends StatefulWidget {
  static const String routeName = "/sliver-app-bar";

  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
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
        padding: EdgeInsets.only(bottom: 55),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blue,
              floating: false,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Sliver App Bar",
                  style: TextStyle(color: Colors.white),
                ),
                background: Container(
                  color: Colors.lightBlue,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100.0,
              delegate: SliverChildListDelegate(
                List.generate(
                  20,
                  (index) => listItem(Colors.white,
                      "Item ${(index + 1).toString().padLeft(2, '0')}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(Color color, String title) => Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
