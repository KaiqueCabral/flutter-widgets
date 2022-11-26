import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  static const String routeName = "/cupertino-activity-indicator";

  @override
  _CupertinoActivityIndicatorPageState createState() =>
      _CupertinoActivityIndicatorPageState();
}

class _CupertinoActivityIndicatorPageState
    extends State<CupertinoActivityIndicatorPage> {
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
        title: Text("Cupertino Activity Indicator"),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: CupertinoActivityIndicator(
                radius: 50,
                animating: true,
              ),
            ),
            Image.network(
              "https://picsum.photos/seed/picsum/100/100",
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              semanticLabel: "Image of an owl from the internet",
            ),
            StreamBuilder<int>(
              stream: getNumber(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.data != null && snapshot.data! > 0) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "${snapshot.data! + 1}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      snapshot.data! + 1 == 100
                          ? Icon(
                              Icons.check_box,
                              color: Colors.green,
                            )
                          : CupertinoActivityIndicator(),
                    ],
                  );
                }
                return Container(
                  height: 0,
                  width: 0,
                );
              },
            ),
          ],
        ),
        minimum: EdgeInsets.all(30),
      ),
    );
  }

  Stream<int> getNumber() {
    Duration interval = Duration(milliseconds: 50);
    Stream<int> stream = Stream<int>.periodic(interval, transform);
    stream = stream.take(100);

    return stream;
  }

  int transform(int value) {
    return value;
  }
}
