import 'package:flutter/material.dart';

appAbout(){
  return AboutListTile(
        child: Text("About"),
        applicationName: "Widgets Test",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.widgets),
        icon: Icon(Icons.info),
      );
}