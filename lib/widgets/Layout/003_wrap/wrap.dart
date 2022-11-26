import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WrapPage extends StatefulWidget {
  static const String routeName = "/wrap";

  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
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
        title: Text("Wrap"),
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
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Text(
                "Wrap works like a Row, but with this Widget the elements will NOT reach the edge.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              color: Colors.lightBlue,
              width: 450,
              height: 110,
              padding: EdgeInsets.all(20),
            ),
            container(Colors.lightBlueAccent),
            container(Colors.lightBlueAccent),
            container(Colors.redAccent),
            container(Colors.redAccent),
            container(Colors.yellowAccent),
            container(Colors.yellowAccent),
            container(Colors.greenAccent),
            container(Colors.greenAccent),
            container(Colors.orangeAccent),
            container(Colors.orangeAccent),
            SizedBox(
              height: 180,
            ),
          ],
        ),
      ),
    );
  }

  Container container(Color color) {
    return Container(
      color: color,
      width: 220,
      height: 100,
    );
  }
}
