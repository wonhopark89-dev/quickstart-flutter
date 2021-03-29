import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("TEST1")),
      body: Container(
        color: Colors.amberAccent,
      ),
    ));
  }
}
