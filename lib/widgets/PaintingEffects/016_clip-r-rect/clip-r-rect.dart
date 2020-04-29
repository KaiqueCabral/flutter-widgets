import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class ClipRRectPage extends StatefulWidget {
  static const String routeName = "/clip-r-rect";

  @override
  _ClipRRectPageState createState() => _ClipRRectPageState();
}

class _ClipRRectPageState extends State<ClipRRectPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
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
        title: Text("ClipRRect"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.lerp(
                    Radius.circular(30),
                    Radius.circular(30),
                    30,
                  )),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    //margin: EdgeInsets.all(10),
                    color: Colors.green,
                    padding: EdgeInsets.all(50),
                    child: Text(
                      "ClipRRect >>> Radius.Lerp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 25)),
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(50),
                    child: Text(
                      "ClipRRect >>> Radius.Elliptical",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    color: Colors.orange,
                    padding: EdgeInsets.all(50),
                    child: Text(
                      "ClipRRect >>> Radius.Circular",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
