import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ValueListenableBuilderPage extends StatefulWidget {
  static const String routeName = "/value-listenable-builder";

  @override
  _ValueListenableBuilderPage createState() => _ValueListenableBuilderPage();
}

class _ValueListenableBuilderPage extends State<ValueListenableBuilderPage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget _text = const Text("ValueListenableBuilder!");
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
        title: Text("Value Listenable Builder"),
      ),
      body: Column(
        children: <Widget>[
          (!kIsWeb)
              ? Container(
                  child: AdWidget(ad: _ad!),
                  height: _ad!.size.height.toDouble(),
                  margin: const EdgeInsets.only(top: 10),
                )
              : Container(
                  height: 0,
                  width: 0,
                ),
          Expanded(
            child: ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget? child) {
                // This builder will only get called when the _counter
                // is updated.
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("You have pushed the button this many times:"),
                    Text(
                      "$value",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    child ??
                        Container(
                          height: 0,
                          width: 0,
                        ),
                  ],
                );
              },
              valueListenable: _counter,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              child: _text,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
