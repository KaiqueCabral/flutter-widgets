import 'package:flutter/material.dart';

class SizedBoxPage extends StatelessWidget {
  static const String routeName = "/sized-box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sized Box")),
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 300.0,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Sized Box!'),
            ),
          ),
        ),
      ),
    );
  }
}
