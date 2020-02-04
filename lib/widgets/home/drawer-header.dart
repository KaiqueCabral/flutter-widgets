import 'package:flutter/material.dart';

appDrawerHeader() {
  return DrawerHeader(
    child: Text(
      "Olá, {}!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
  );
}
