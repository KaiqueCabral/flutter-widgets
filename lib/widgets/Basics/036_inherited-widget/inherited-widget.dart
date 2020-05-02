import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';

class User {
  String name;
  User(this.name);
}

class InheritedWidgetPage extends StatelessWidget {
  static const String routeName = "/inherited-widget";

  @override
  Widget build(BuildContext context) {
    return AncestorWidget(
      user: User("[USER NAME]"),
      child: _AncestorWidget(),
    );
  }
}

class AncestorWidget extends InheritedWidget {
  final User user;
  AncestorWidget({Key key, this.user, Widget child})
      : super(key: key, child: child);

  static AncestorWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AncestorWidget)
        as AncestorWidget);
  }

  @override
  bool updateShouldNotify(AncestorWidget oldWidget) => true;
}

class _AncestorWidget extends StatefulWidget {
  _AncestorWidget({Key key}) : super(key: key);

  _InheritedWidgetPage createState() => _InheritedWidgetPage();
}

class _InheritedWidgetPage extends State<_AncestorWidget> {
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

  @override
  Widget build(BuildContext context) {
    var ancestorWidget = AncestorWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Widget"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: Text("Username: ${ancestorWidget.user.name}"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "CLICK HERE >>>",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                ),
                RaisedButton(
                  child: Text("OK"),
                  onPressed: () {
                    setState(() {
                      if (ancestorWidget.user != null) {
                        ancestorWidget.user.name = "kaiquecabral";
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
