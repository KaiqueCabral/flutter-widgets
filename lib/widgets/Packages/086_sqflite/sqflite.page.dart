import 'package:flutter/foundation.dart';
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
        title: Text("SQLite"),
      ),
      bottomSheet: AdManager.showBannerAd(_ad),
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
    if (await canLaunchUrl(Uri.https(url))) {
      await launchUrl(
        Uri.https(url),
      );
    } else {
      throw "Could not launch $url";
    }
  }
}
