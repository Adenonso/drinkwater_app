import 'package:flutter/material.dart';
import 'home.dart';
import 'pages/watergrade.dart';
import 'pages/waterplan.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/watergrade': (context) => Grade(),
      '/waterplan': (context) => Plan(),
    },
  ));
}
