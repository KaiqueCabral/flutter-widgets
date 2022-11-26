import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DividerPage extends StatefulWidget {
  static const String routeName = "/divider";

  @override
  _DividerPageState createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
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
        title: Text("Divider"),
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
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.amber[300],
                child: const Center(
                  child: Text(
                    "As you can see below, there are two lines (DIVIDER).\n"
                    "The first DIVIDER is defined in the Material App."
                    "\n"
                    "\n"
                    "The list right after is using ListView.separated().",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Divider(),
            const Divider(
              color: Colors.pink,
              endIndent: 40,
              indent: 40,
              height: 20,
              thickness: 5,
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 110),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Item ${index + 1}"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      endIndent: 10,
                      indent: 10,
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
