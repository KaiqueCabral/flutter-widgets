import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class AbsorbPointerPage extends StatefulWidget {
  static const String routeName = "/absorb-pointer";

  _AbsorbPointerPage createState() => _AbsorbPointerPage();
}

class _AbsorbPointerPage extends State<AbsorbPointerPage> {
  String _text = "No button was clicked!";
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  _expanded(String _buttonText, Color _buttonColor) => Expanded(
        child: RaisedButton(
          color: _buttonColor,
          child: Text(
            _buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                    child: RaisedButton(
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
                    child: RaisedButton(
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
