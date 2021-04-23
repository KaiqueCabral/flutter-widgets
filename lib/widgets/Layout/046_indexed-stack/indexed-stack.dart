import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class IndexedStackPage extends StatefulWidget {
  static const String routeName = "/indexed-stack";

  _IndexedStackPage createState() => _IndexedStackPage();
}

class _IndexedStackPage extends State<IndexedStackPage> {
  int _indexStack = 0;
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
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
        title: Text("Indexed Stack"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            IndexedStack(
              index: _indexStack,
              sizing: StackFit.expand,
              children: <Widget>[
                _containerChannel(Colors.red, "Channel 0"),
                _containerChannel(Colors.orange, "Channel 1"),
                _containerChannel(Colors.yellow, "Channel 2"),
                _containerChannel(Colors.amber, "Channel 3"),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                  "Like Flutter's website says, \"IndexedStack\" works like a TV." +
                      "\nYou can click on the buttons and the widgets will work like you are changing the TV channels."),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => ElevatedButton(
                  child: Text("$index"),
                  onPressed: () {
                    setState(() {
                      _indexStack = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _containerChannel(Color color, String channel) => Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        color: color,
        alignment: Alignment.center,
        child: Text(
          channel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      );
}
