import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ContainerPage extends StatefulWidget {
  static const String routeName = "/container";

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
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
        title: Text("Container"),
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
      body: Container(
        color: Colors.lightGreenAccent[100],
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.blue[600],
                    alignment: Alignment.center,
                    child: Text(
                      "Normal Container",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "Transform",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    transform: Matrix4.rotationZ(0.1),
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red[900]!,
                          Colors.red[800]!,
                          Colors.red[700]!,
                          Colors.red[600]!,
                          Colors.red[500]!,
                          Colors.red,
                          Colors.deepOrange,
                          Colors.orange,
                          Colors.yellow,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    margin: EdgeInsets.all(40),
                    padding: EdgeInsets.all(25.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Container Using BoxDecoration",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
