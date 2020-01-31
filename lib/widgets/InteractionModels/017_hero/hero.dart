import 'package:flutter/material.dart';
import 'package:widget_tests/widgets/InteractionModels/017_hero/hero-details.dart';

class HeroPage extends StatefulWidget {
  static const String routeName = "/hero";

  _HeroPage createState() => _HeroPage();
}

class _HeroPage extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
                          size: 70.0,
                        );
                      } else if (direction == HeroFlightDirection.pop) {
                        return Icon(
                          Icons.flight_takeoff,
                          size: 70.0,
                        );
                      }
                      return Icon(
                        Icons.flight_land,
                        size: 70.0,
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
