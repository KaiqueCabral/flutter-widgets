import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class DraggablePage extends StatefulWidget {
  static const String routeName = "/draggable";

  _DraggablePage createState() => _DraggablePage();
}

class _DraggablePage extends State<DraggablePage> {
  int _radio = 0, _tv = 0, _star = 0;
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
        title: Text("Draggable"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                expandedDraggable(Colors.yellow, Icons.radio, "Radio"),
                expandedDraggable(Colors.orange, Icons.tv, "TV"),
                expandedDraggable(Colors.yellow, Icons.star, "Star"),
              ],
            ),
            Row(
              children: <Widget>[
                expandedCounter(_radio),
                expandedCounter(_tv),
                expandedCounter(_star),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return title("TV", Colors.red);
                    },
                    onWillAccept: (data) {
                      return (data == "TV");
                    },
                    onAccept: (data) {
                      setState(() {
                        _tv++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return title("Star", Colors.red);
                    },
                    onWillAccept: (data) {
                      return (data == "Star");
                    },
                    onAccept: (data) {
                      setState(() {
                        _star++;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: DragTarget(
                    builder:
                        (context, List<String> candidateData, rejectedData) {
                      return title("Radio", Colors.red);
                    },
                    onWillAccept: (data) {
                      return (data == "Radio");
                    },
                    onAccept: (data) {
                      setState(() {
                        _radio++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center title(String title, Color color) => Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 50, top: 50),
          child: Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 22.0,
            ),
          ),
        ),
      );

  Expanded expandedCounter(int counter) => Expanded(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            counter.toString(),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Expanded expandedDraggable(MaterialColor color, IconData icon, String text) =>
      Expanded(
        child: Draggable(
          child: Container(
            width: 100,
            height: 100,
            color: color[300],
            alignment: Alignment.center,
            child: Icon(icon),
          ),
          feedback: Container(
            width: 100,
            height: 100,
            color: color,
            alignment: Alignment.center,
            child: Icon(icon),
          ),
          data: text,
        ),
      );
}
