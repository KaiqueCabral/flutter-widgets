import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class ValueListenableBuilderPage extends StatefulWidget {
  static const String routeName = "/value-listenable-builder";

  @override
  _ValueListenableBuilderPage createState() => _ValueListenableBuilderPage();
}

class _ValueListenableBuilderPage extends State<ValueListenableBuilderPage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget _text = const Text("ValueListenableBuilder!");
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
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
      appBar: AppBar(title: Text("Value Listenable Builder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button this many times:"),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget child) {
                // This builder will only get called when the _counter
                // is updated.
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "$value",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    child,
                  ],
                );
              },
              valueListenable: _counter,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: _text,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
