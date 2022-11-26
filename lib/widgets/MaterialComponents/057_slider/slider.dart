import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SliderPage extends StatefulWidget {
  static const String routeName = "/slider";

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
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

  double _divisions = 0;
  RangeValues _range = RangeValues(90, 110);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
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
        padding: EdgeInsets.all(50),
        color: Colors.teal[100],
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 50,
              ),
              child: Text("Divisions"),
            ),
            Slider(
              min: 0,
              max: 200,
              value: _divisions,
              divisions: 20,
              label: "Divisions",
              onChanged: (value) {
                setState(() => _divisions = value);
              },
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 50,
              ),
              child: Text("Range Slider"),
            ),
            RangeSlider(
              min: 0,
              max: 200,
              divisions: 4,
              values: _range,
              labels: RangeLabels("${_range.start}", "${_range.end}"),
              onChanged: (RangeValues _newRange) {
                setState(() {
                  _range = _newRange;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
