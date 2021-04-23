import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Check {
  bool isLoading;
  Check(this.isLoading);
}

class InheritedWidgetPage extends StatelessWidget {
  static const String routeName = "/inherited-widget";

  @override
  Widget build(BuildContext context) {
    return AncestorWidget(
      check: Check(false),
      child: _AncestorWidget(),
    );
  }
}

class AncestorWidget extends InheritedWidget {
  final Check check;
  AncestorWidget({Key key, this.check, Widget child})
      : super(key: key, child: child);

  static AncestorWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AncestorWidget>();
  }

  @override
  bool updateShouldNotify(AncestorWidget oldWidget) => true;
}

class _AncestorWidget extends StatefulWidget {
  _AncestorWidget({Key key}) : super(key: key);

  _InheritedWidgetPage createState() => _InheritedWidgetPage();
}

class _InheritedWidgetPage extends State<_AncestorWidget> {
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
    var ancestorWidget = AncestorWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Widget"),
      ),
      bottomSheet: Container(
        child: AdWidget(ad: _ad),
        height: _ad.size.height.toDouble(),
        margin: const EdgeInsets.only(top: 10),
      ),
      body: ancestorWidget.check.isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Username: ${ancestorWidget.check.isLoading}",
                    ),
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
                      ElevatedButton(
                        child: Text("OK"),
                        onPressed: () async {
                          setState(() {
                            ancestorWidget.check.isLoading = true;
                          });

                          await Future.delayed(Duration(seconds: 2));

                          setState(() {
                            ancestorWidget.check.isLoading = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: !ancestorWidget.check.isLoading,
                    child: ElevatedButton(
                      child: Icon(Icons.ac_unit),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
