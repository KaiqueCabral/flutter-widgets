import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class DismissiblePage extends StatefulWidget {
  static const String routeName = "/dismissible";

  _DismissiblePage createState() => _DismissiblePage();
}

class _DismissiblePage extends State<DismissiblePage> {
  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");
  String _text = "";
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.banner)
    //..load()
    //..show(anchorType: AnchorType.top, anchorOffset: 90);
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
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 55),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.red[100],
            ),
            secondaryBackground: Container(
              color: Colors.green,
            ),
            child: ListTile(
              title: Text("$item"),
            ),
            onDismissed: (direction) {
              setState(
                () {
                  if (direction == DismissDirection.startToEnd) {
                    _text = " (Removed)";
                    _items.removeAt(index);
                  } else if (direction == DismissDirection.endToStart) {
                    _items[index] += " Confirmed";
                    _text = " (Confirmed)";
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "$item $_text",
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
