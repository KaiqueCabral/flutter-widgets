import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class ListViewPage extends StatefulWidget {
  static const String routeName = "/list-view";

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Container(
        color: Colors.cyanAccent[700],
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            container(Colors.amber[600], "Entry A"),
            container(Colors.amber[500], "Entry B"),
            container(Colors.amber[100], "Entry C"),
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
