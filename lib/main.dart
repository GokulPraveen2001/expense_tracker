import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        accentColor: Colors.black87),
    routes: {"/": (context) => HOME()},
  ));
}
