import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SemanticsPage extends StatefulWidget {
  static const String routeName = "/semantics";

  @override
  _SemanticsPageState createState() => _SemanticsPageState();
}

class _SemanticsPageState extends State<SemanticsPage> {
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
        title: Text("Semantics"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onTap: () {
                    print("Button click!");
                  },
                  child: ElevatedButton(
                    child: Text("Teste"),
                    onPressed: () {},
                  ),
                ),
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onCopy: () {
                    print("Tried to copy!");
                  },
                  onTap: () {
                    print("Button click!");
                  },
                  child: Text("Semantics Test!"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onTap: () {
                    print("Button click!");
                  },
                  child: ElevatedButton(
                    child: Text("Teste"),
                    onPressed: () {},
                  ),
                ),
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onCopy: () {
                    print("Tried to copy!");
                  },
                  onTap: () {
                    print("Button click!");
                  },
                  child: Text("Semantics Test!"),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
              child: AdWidget(ad: _ad),
              width: _ad.size.width.toDouble(),
              height: _ad.size.height.toDouble(),
            ),
          ],
        ),
        color: Colors.indigo[100],
      ),
    );
  }
}
