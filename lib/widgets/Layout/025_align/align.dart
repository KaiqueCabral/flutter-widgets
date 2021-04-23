import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlignPage extends StatefulWidget {
  static const String routeName = "/align";
  static const double _sizeBoxWidth = 30;

  @override
  _AlignPageState createState() => _AlignPageState();
}

class _AlignPageState extends State<AlignPage> {
  double _widthContainer(BuildContext context) =>
      (MediaQuery.of(context).size.width / 2.0) - AlignPage._sizeBoxWidth;
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
        title: Text("Align"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _container(
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                  context,
                ),
                _sizeBox(),
                _container(
                  Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                  context,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: _widthContainer(context),
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      _alignFlutterLogoOnly(-1, -1),
                      Align(
                        alignment: Alignment(
                          -1,
                          -1,
                        ),
                        child: Text(
                          "Alignment (-1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using ALIGNMENT: The X: 0 and Y: 0 is in the center of the Parent Widget.",
                      ),
                    ],
                  ),
                ),
                _sizeBox(),
                Container(
                  height: 150.0,
                  width: _widthContainer(context),
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      _alignFlutterLogoOnly(1, -1),
                      Align(
                        alignment: Alignment(
                          1,
                          -1,
                        ),
                        child: Text(
                          "Alignment (1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                          "Using ALIGNMENT: The X: 0 and Y: 0 is in the center of the Parent Widget.")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: _widthContainer(context),
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
                _sizeBox(),
                Container(
                  height: 100.0,
                  width: _widthContainer(context),
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 170.0,
                  width: _widthContainer(context),
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(
                          0,
                          0,
                        ),
                        child: Text(
                          "FractionalOffset (-1, -1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using FRACTIONALOFFSET: The X: 0 and Y: 0 is in the TOP-LEFT of the Parent Widget.",
                      ),
                      Align(
                        alignment: FractionalOffset(0, 1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                _sizeBox(),
                Container(
                  height: 170.0,
                  width: _widthContainer(context),
                  color: Colors.red[50],
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset(
                          0,
                          0,
                        ),
                        child: Text(
                          "FractionalOffset (1, 1)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Using FRACTIONALOFFSET: The X: 0 and Y: 0 is in the TOP-LEFT of the Parent Widget.",
                      ),
                      Align(
                        alignment: FractionalOffset(1, 1),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _container(Align _align, BuildContext context) => Container(
        height: 100.0,
        width: _widthContainer(context),
        color: Colors.blue[50],
        child: _align,
      );

  _sizeBox() => const SizedBox(
        width: AlignPage._sizeBoxWidth,
      );

  _alignFlutterLogoOnly(double x, double y) => Align(
        alignment: Alignment(x, y),
        child: FlutterLogo(
          size: 60,
        ),
      );
}
