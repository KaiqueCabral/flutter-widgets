import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget {
  static const String routeName = "/sliver-app-bar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: false,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Sliver App Bar",
                style: TextStyle(color: Colors.white),
              ),
              background: Container(
                color: Colors.lightBlue,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate([
              listItem(Colors.white, "Item 01"),
              listItem(Colors.white, "Item 02"),
              listItem(Colors.white, "Item 03"),
              listItem(Colors.white, "Item 04"),
              listItem(Colors.white, "Item 05"),
              listItem(Colors.white, "Item 06"),
              listItem(Colors.white, "Item 07"),
              listItem(Colors.white, "Item 08"),
              listItem(Colors.white, "Item 09"),
              listItem(Colors.white, "Item 10"),
              listItem(Colors.white, "Item 11"),
              listItem(Colors.white, "Item 12"),
              listItem(Colors.white, "Item 13"),
              listItem(Colors.white, "Item 14"),
              listItem(Colors.white, "Item 15"),
              listItem(Colors.white, "Item 16"),
              listItem(Colors.white, "Item 17"),
              listItem(Colors.white, "Item 18"),
              listItem(Colors.white, "Item 19"),
              listItem(Colors.white, "Item 20"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget listItem(Color color, String title) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
