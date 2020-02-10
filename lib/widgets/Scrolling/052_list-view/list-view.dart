import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  static const String routeName = "/list-view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Container(
        color: Colors.cyanAccent[700],
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              color: Colors.orange,
              child: ListTile(
                title: Text(
                  "Teste ListTile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.deepOrange,
              child: CheckboxListTile(
                title: Text(
                  "CheckboxListTile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: true,
                onChanged: (hasChanged) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
