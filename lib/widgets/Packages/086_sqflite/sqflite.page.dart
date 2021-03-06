import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class SQLitePage extends StatefulWidget {
  static const String routeName = "/sqflite-package";

  @override
  _SQLitePageState createState() => _SQLitePageState();
}

class _SQLitePageState extends State<SQLitePage> {
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
        title: Text("SQLite"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
        margin: const EdgeInsets.only(top: 10),
      ),
      body: Center(
        child: InkWell(
          child: Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Click here to access my SQLite project on GitHub",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          onTap: () => launchInWebViewOrVC(
            "https://github.com/KaiqueCabral/flutter-persistence/",
          ),
        ),
      ),
    );
  }

  static Future<void> launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw "Could not launch $url";
    }
  }
}
