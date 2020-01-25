import 'dart:ui';
import 'package:flutter/material.dart';

class BackdropFilterPage extends StatelessWidget {
  static const String routeName = "/backdrop-filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Backdrop Filter"),
      ),
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            child: Image.network(
                "https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
            constraints: BoxConstraints.expand(),
          ),
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 6,
              ),
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.grey.shade100.withOpacity(0.2),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
