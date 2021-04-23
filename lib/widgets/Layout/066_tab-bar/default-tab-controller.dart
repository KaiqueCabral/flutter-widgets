import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class TabsPage extends StatefulWidget {
  static const String routeName = "/tabs";

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.fullBanner,
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabs"),
          bottom: TabBar(
            tabs: <Widget>[
              _tab(Icons.directions_bike, "Bike"),
              _tab(Icons.directions_bus, "Bus"),
              _tab(Icons.directions_car, "Car"),
            ],
          ),
        ),
        bottomSheet: Container(
          child: AdWidget(ad: _ad),
          height: _ad.size.height.toDouble(),
        ),
        body: TabBarView(
          children: <Widget>[
            _tabContainer("Bike is a good way to exercise."),
            _tabContainer("Bus can get you to many place."),
            _tabContainer(
              "Bus can get you to many places.\n" +
                  "Most of the time faster than bus.",
            ),
          ],
        ),
      ),
    );
  }

  _tab(IconData icon, String text) => Tab(
        icon: Icon(icon),
        text: text,
      );

  _tabContainer(String text) => Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
}
