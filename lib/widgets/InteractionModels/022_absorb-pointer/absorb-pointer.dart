import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AbsorbPointerPage extends StatefulWidget {
  static const String routeName = "/absorb-pointer";

  _AbsorbPointerPage createState() => _AbsorbPointerPage();
}

class _AbsorbPointerPage extends State<AbsorbPointerPage> {
  String _text = "No button was clicked!";
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.largeBanner,
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

  _expanded(String _buttonText, Color _buttonColor) => Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _buttonColor,
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Text(_buttonText),
          onPressed: () {
            setState(
              () {
                _text = "Clicked " + _buttonText;
              },
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absorb Pointer"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Text(_text),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  width: constraints.maxWidth * 0.9,
                  padding: EdgeInsets.all(20),
                );
              },
            ),
            Row(
              children: <Widget>[
                _expanded(
                  "Click Deep Orange",
                  Colors.deepOrange,
                ),
                _expanded(
                  "Click Deep Purple",
                  Colors.deepPurple,
                ),
                _expanded(
                  "Click Green",
                  Colors.green,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                _expanded(
                  "Click Deep Purple",
                  Colors.deepPurple,
                ),
                _expanded(
                  "Click Green",
                  Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: AbsorbPointer(
                    child: ElevatedButton(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Disabled absorbing: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "true",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _text = "Disabled (absorbing: false)";
                          },
                        );
                      },
                    ),
                    absorbing: true,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: AbsorbPointer(
                    child: ElevatedButton(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Disabled absorbing: ",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "false",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _text = "Disabled (absorbing: false)";
                          },
                        );
                      },
                    ),
                    absorbing: false,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("The button will NOT WORK!"),
                Text("The button will WORK!"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
