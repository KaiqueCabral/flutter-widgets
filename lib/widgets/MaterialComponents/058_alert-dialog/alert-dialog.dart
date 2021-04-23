import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class AlertDialogPage extends StatefulWidget {
  static const String routeName = "/alert-dialog";

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  String _text = "";
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    //bannerAd = AdsStandard().createBannerAd(AdSize.largeBanner)
    //..load()
    //..show();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  simpleDialog(BuildContext context) {
    AlertDialog _dialog = AlertDialog(
      content: Text("You can just click on the \"OK\" button."),
      actions: <Widget>[
        ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _dialog;
      },
    );
  }

  twoButtonsDialog(BuildContext context) {
    AlertDialog _dialog = AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("You can just click on the \"OK\" button or \"Cancel\"."),
      actions: <Widget>[
        ElevatedButton(
          child: Text("OK"),
          onPressed: () {
            setState(() {
              _text = "Testing the button \"OK\".";
            });
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Container(
        color: Colors.yellow[100],
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(bottom: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Normal Alert Dialog"),
              onPressed: () {
                simpleDialog(context);
              },
            ),
            Text(_text),
            ElevatedButton(
              child: Text("Alert Dialog with Two Buttons"),
              onPressed: () {
                twoButtonsDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
