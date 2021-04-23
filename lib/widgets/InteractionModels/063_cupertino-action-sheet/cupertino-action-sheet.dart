import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheetPage extends StatefulWidget {
  static const String routeName = "/cupertino-action-sheet";

  @override
  _CupertinoActionSheetPageState createState() =>
      _CupertinoActionSheetPageState();
}

class _CupertinoActionSheetPageState extends State<CupertinoActionSheetPage> {
  String _choice = "Click on the button above and choose an option!";
  String _option = "";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Action Sheet"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Hello!"),
              ElevatedButton(
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
