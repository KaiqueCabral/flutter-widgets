import 'package:flutter/material.dart';

class IgnorePointerPage extends StatefulWidget {
  static const String routeName = "/ignore-pointer";
  @override
  _IgnorePointerPageState createState() => _IgnorePointerPageState();
}

class _IgnorePointerPageState extends State<IgnorePointerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ignore Pointer"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("IgnorePointer >>>"),
                IgnorePointer(
                  ignoring: true,
                  child: FlatButton.icon(
                    color: Colors.red[100],
                    onPressed: () {},
                    icon: Icon(
                      Icons.touch_app,
                      color: Colors.black54,
                    ),
                    label: Text("This button doesn't work"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Ignore Pointer Test"),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
