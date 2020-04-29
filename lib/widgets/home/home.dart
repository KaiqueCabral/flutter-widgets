import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widget_tests/shared/ads/ads_admob.dart';
import 'package:widget_tests/widgets/home/menu-items.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Use the menu on the TOP-LEFT to check the widgets",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          AdmobBanner(
            adUnitId: AdsAdmob.getBannerAdUnitId(),
            adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
          ),
        ],
      ),
      drawer: MenuItems(),
    );
  }
}
