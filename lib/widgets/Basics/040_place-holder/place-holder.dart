import 'package:flutter/material.dart';

class PlaceHolderPage extends StatelessWidget {
  static const String routeName = "/place-holder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Holder"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width * .6,
              height: 25,
            ),
            Container(
              color: Colors.orange,
              width: MediaQuery.of(context).size.width * .8,
              height: 50,
            ),
            Container(
              color: Colors.teal,
              width: MediaQuery.of(context).size.width * .9,
              height: 75,
            ),
            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 200,
              strokeWidth: 5,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
