import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  static const String routeName = "/tabs";

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
