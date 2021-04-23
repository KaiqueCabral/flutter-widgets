import 'package:flutter_widgets/shared/ads/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/InteractionModels/017_hero/hero-details.dart';

class HeroPage extends StatefulWidget {
  static const String routeName = "/hero";

  _HeroPage createState() => _HeroPage();
}

class _HeroPage extends State<HeroPage> {
  BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
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
        title: Text("Hero"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: AdWidget(ad: _ad),
              height: _ad.size.height.toDouble(),
              margin: const EdgeInsets.only(top: 10),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: "add_location",
                    transitionOnUserGestures: true,
                    child: Icon(
                      Icons.add_location,
                      color: Colors.red,
                      size: 100.0,
                    ),
                    placeholderBuilder: (context, size, widget) {
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: "chat_bubble",
                    transitionOnUserGestures: true,
                    flightShuttleBuilder: (flightContext, animation, direction,
                        fromContext, toContext) {
                      if (direction == HeroFlightDirection.push) {
                        return Icon(
                          Icons.flight_land,
                          size: 100.0,
                        );
                      } else if (direction == HeroFlightDirection.pop) {
                        return Icon(
                          Icons.flight_takeoff,
                          size: 100.0,
                        );
                      }
                      return Icon(
                        Icons.flight_land,
                        size: 100.0,
                      );
                    },
                    child: Icon(
                      Icons.chat_bubble,
                      color: Colors.orange,
                      size: 100.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: "delete",
                    transitionOnUserGestures: true,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                      size: 100.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.view_week,
                    color: Colors.red,
                    size: 100.0,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.wifi_tethering,
                    color: Colors.orange,
                    size: 100.0,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.android,
                    color: Colors.red[900],
                    size: 100.0,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                    size: 100.0,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.camera_front,
                    color: Colors.orange,
                    size: 100.0,
                  ),
                ),
                Expanded(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.red[900],
                    size: 100.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.touch_app,
        ),
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 5),
            pageBuilder: (_, __, ___) => HeroDetailsPage(),
          ),
        ),
      ),
    );
  }
}
