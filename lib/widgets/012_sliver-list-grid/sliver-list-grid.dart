import 'package:flutter/material.dart';

class SliverListGridPage extends StatelessWidget {
  static const String routeName = "/sliver-list-grid";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            floating: false,
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Silver List/Grid",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (
                BuildContext context,
                int index,
              ) {
                return listItem(
                  Colors.white,
                  "Item " + (index + 1).toString(),
                );
              },
              childCount: 8,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (
                BuildContext context,
                int index,
              ) {
                return listItem(
                  Colors.indigo,
                  "Item " + (index + 1).toString().padLeft(2, '0'),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(Color color, String title) => Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 1.0,
              style: BorderStyle.solid,
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
