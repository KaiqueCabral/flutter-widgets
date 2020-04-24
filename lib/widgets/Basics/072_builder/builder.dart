import 'package:flutter/material.dart';

class BuilderPage extends StatefulWidget {
  static const String routeName = "/builder";
  @override
  _BuilderPageState createState() => _BuilderPageState();
}

class _BuilderPageState extends State<BuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Builder"),
      ),
      body: Container(),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 15),
                  content: Text(
                      "The SnackBar wouldn't work inside of only one BuildContext.\n\n"
                      "Buuut, thanks to the Builder Widget the Snackbar is working."),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
