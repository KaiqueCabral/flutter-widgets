import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  static const String routeName = "/tabs";

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
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
