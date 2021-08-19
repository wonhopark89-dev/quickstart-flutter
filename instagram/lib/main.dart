import 'package:flutter/material.dart';
import 'package:instagram/constants/material_white.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
      color: Colors.deepOrange,
      theme: ThemeData(primarySwatch: white),
    );
  }
}
