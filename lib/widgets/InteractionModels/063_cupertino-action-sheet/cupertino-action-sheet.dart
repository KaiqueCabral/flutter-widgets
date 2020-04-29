import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_standard.dart';

class CupertinoActionSheetPage extends StatefulWidget {
  static const String routeName = "/cupertino-action-sheet";

  @override
  _CupertinoActionSheetPageState createState() =>
      _CupertinoActionSheetPageState();
}

class _CupertinoActionSheetPageState extends State<CupertinoActionSheetPage> {
  String _choice = "Click on the button above and choose an option!";
  String _option = "";
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
      ..load()
      ..show(anchorType: AnchorType.top, anchorOffset: 90);
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Action Sheet"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Hello!"),
              RaisedButton(
                child: Text("Click here!"),
                onPressed: () {
                  final cupertinoActionSheet = CupertinoActionSheet(
                    actions: <Widget>[
                      _cupertinoAction(1),
                      _cupertinoAction(2),
                      _cupertinoAction(3),
                      _cupertinoAction(4),
                    ],
                    title: Text(
                      "Choose one option",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[500],
                      ),
                    ),
                    message: Text(
                      "You can choose any option you want to.\n" +
                          "They will do basically the same.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  );

                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return cupertinoActionSheet;
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(_choice),
              Text(
                _option,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onPressed(int option) {
    setState(() {
      _choice = "Good option! You selected:";
      _option = "Option $option";
    });
    Navigator.pop(context);
  }

  _cupertinoAction(int option) {
    return CupertinoActionSheetAction(
      onPressed: () => _onPressed(option),
      child: Text("Option $option"),
      isDefaultAction: false,
    );
  }
}
