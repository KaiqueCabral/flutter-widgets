import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListViewPage extends StatefulWidget {
  static const String routeName = "/list-view";

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
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
        title: Text("List View"),
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
        color: Colors.cyanAccent[700],
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            container(Colors.amber[600]!, "Entry A"),
            container(Colors.amber[500]!, "Entry B"),
            container(Colors.amber[100]!, "Entry C"),
            Container(
              color: Colors.orange,
              child: ListTile(
                title: Text(
                  "Teste ListTile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.deepOrange,
              child: CheckboxListTile(
                title: Text(
                  "CheckboxListTile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: true,
                onChanged: (hasChanged) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container container(Color color, String text) {
    return Container(
      height: 50,
      color: color,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
