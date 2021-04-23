import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BuilderPage extends StatefulWidget {
  static const String routeName = "/builder";
  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
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
        title: Text("Builder"),
      ),
      body: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
        margin: const EdgeInsets.only(top: 10),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 15),
                  content: Text(
                      "The SnackBar wouldn't work inside of only one BuildContext.\n\n"
                      "Buuut, thanks to the Builder Widget the Snackbar is working."),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
