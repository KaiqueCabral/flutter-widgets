import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  static const String routeName = "/fitted-box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitted Box"),
      ),
      body: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: <Widget>[
              Container(
                width: 1000.0, //Over the width and still working
                height: 1000.0, //Over the height and still working
                color: Colors.deepPurple,
                child: FittedBox(
                  fit: BoxFit.contain, //Fill the whole thing with the image
                  child: Image.asset(
                    'assets/images/flutter-fade-in-image.jpg',
                  ),
                ),
              ),
              Container(
                child: FittedBox(
                  fit: BoxFit.fill, //Fill the whole thing with the image
                  child: Image.asset(
                    'assets/images/flutter-fade-in-image.jpg',
                  ),
                ),
                color: Colors.deepOrange,
                width: 1000.0,
                height: 1000.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
