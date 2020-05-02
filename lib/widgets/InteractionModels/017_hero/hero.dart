import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/shared/ads/ads_standard.dart';
import 'package:flutter_widgets/widgets/InteractionModels/017_hero/hero-details.dart';

class HeroPage extends StatefulWidget {
  static const String routeName = "/hero";

  _HeroPage createState() => _HeroPage();
}

class _HeroPage extends State<HeroPage> {
  BannerAd bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    bannerAd = AdsStandard().createBannerAd(AdSize.banner)
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
        title: Text("Hero"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
