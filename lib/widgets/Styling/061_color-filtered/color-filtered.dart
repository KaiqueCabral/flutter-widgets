import 'package:flutter/material.dart';

class ColorFilteredPage extends StatelessWidget {
  static const String routeName = "/color-filtered";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Filtered"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ColorFiltered(
                    child:
                        Image.asset("assets/images/flutter-fade-in-image.jpg"),
                    colorFilter: ColorFilter.mode(
                      Colors.red,
                      BlendMode.modulate,
                    ),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
