import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class ExpandedPage extends StatefulWidget {
  static const String routeName = "/expanded";

  @override
  _ExpandedPageState createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.banner)
    //..load()
    //..show();
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
        title: Text("Expanded"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Colors.blue, height: 125, width: 400 (fixed values)\n\n" +
                  "Change the \"height\" property to \"50\", for example.\n" +
                  "If you do so, the second and third box will expand dynamically.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            color: Colors.blue,
            height: 150,
            width: 400,
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                "This Container will expand and fit in the available space (vertically). It's expanding dynamically.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Arial",
                  color: Colors.white,
                ),
              ),
              color: Colors.deepOrange,
              width: 400,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              width: 400,
              padding: EdgeInsets.all(10),
              child: Text(
                "This Container will expand and fit in the available space (vertically).\n\n" +
                    "- It's almost the same of the second box.\n" +
                    "- This Container is using \"Safe Area\" widget.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: "Arial",
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text("Flex 1"),
                    color: Colors.white38,
                    height: 100,
                  ),
                  flex: 2,
                ),
                Container(
                  child: Text(
                      "This Container will NOT expand (fixed values).\n" +
                          "It's not inside of an Expanded Widget, so the Container will use its fixed values.",
                      textAlign: TextAlign.left),
                  color: Colors.white60,
                  height: 100,
                  width: 205,
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Flex 2"),
                    color: Colors.white,
                    height: 100,
                  ),
                ),
              ],
            ),
            color: Colors.amber,
            height: 120,
            width: 400,
            padding: EdgeInsets.only(bottom: 55),
          ),
        ],
      ),
    );
  }
}
