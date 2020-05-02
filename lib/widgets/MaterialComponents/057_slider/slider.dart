import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class SliderPage extends StatefulWidget {
  static const String routeName = "/slider";

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
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
      body: Container(
        padding: EdgeInsets.only(top: 50),
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
