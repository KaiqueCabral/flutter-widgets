import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_admob.dart';

class SemanticsPage extends StatelessWidget {
  static const String routeName = "/semantics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semantics"),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onTap: () {
                    print("Button click!");
                  },
                  child: RaisedButton(
                    child: Text("Teste"),
                    onPressed: () {},
                  ),
                ),
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onCopy: () {
                    print("Tried to copy!");
                  },
                  onTap: () {
                    print("Button click!");
                  },
                  child: Text("Semantics Test!"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onTap: () {
                    print("Button click!");
                  },
                  child: RaisedButton(
                    child: Text("Teste"),
                    onPressed: () {},
                  ),
                ),
                Semantics(
                  button: true,
                  hint: "You can click here, I won't do anything.",
                  label: "Click here!",
                  onCopy: () {
                    print("Tried to copy!");
                  },
                  onTap: () {
                    print("Button click!");
                  },
                  child: Text("Semantics Test!"),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: AdmobBanner(
                adUnitId: AdsAdmob.getBannerAdUnitId(),
                adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
              ),
            ),
          ],
        ),
        color: Colors.indigo[100],
      ),
    );
  }
}
