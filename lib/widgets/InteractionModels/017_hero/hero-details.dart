import 'package:flutter/material.dart';

class HeroDetailsPage extends StatefulWidget {
  static const String routeName = "/hero-details";

  _HeroDetailsPage createState() => _HeroDetailsPage();
}

class _HeroDetailsPage extends State<HeroDetailsPage> {
  //static const String routeName = "/hero-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Details"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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
                  child: Hero(
                    tag: "chat_bubble",
                    transitionOnUserGestures: true,
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
                Expanded(
                  child: Hero(
                    tag: "add_location",
                    transitionOnUserGestures: true,
                    child: Icon(
                      Icons.add_location,
                      color: Colors.red,
                      size: 100.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
