import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OpacityPage extends StatefulWidget {
  static const String routeName = "/opacity";

  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
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
        title: Text("Opacity"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 150,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Red",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: 0.75,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(5),
                        height: 150,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                              "The same Red box\n\nBut with Opacity (0.75).",
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 150,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Red",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Opacity(
                        child: Image.network(
                          "https://picsum.photos/seed/picsum/600/300",
                          colorBlendMode: BlendMode.modulate,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent progress) {
                            if (progress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                        opacity: 0.75,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
