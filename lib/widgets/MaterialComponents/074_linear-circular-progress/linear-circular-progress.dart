import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LinearCircularProgressPage extends StatefulWidget {
  static const String routeName = "/linear-circular-progress";
  @override
  _LinearCircularProgressPageState createState() =>
      _LinearCircularProgressPageState();
}

class _LinearCircularProgressPageState
    extends State<LinearCircularProgressPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
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
        title: Text("Linear & Circular Progress Indicator"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              strokeWidth: 5,
              semanticsLabel: "Loading",
              semanticsValue: "Loading",
            ),
            LinearProgressIndicator(
              semanticsLabel: "Loading",
              semanticsValue: "Loading",
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
            Image.network(
              "https://picsum.photos/seed/picsum/600/300",
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
              semanticLabel: "Image of an owl from the internet",
            ),
            StreamBuilder<int>(
              stream: getNumber(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.data != null && snapshot.data > 0) {
                  return Column(
                    children: <Widget>[
                      Text("${snapshot.data + 1}"),
                      LinearProgressIndicator(
                        value: (snapshot.data + 1) / 100,
                      )
                    ],
                  );
                }
                return Container();
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
