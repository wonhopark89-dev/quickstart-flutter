import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo", theme: ThemeData(), home: SplashScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/imgs/pengsoo.jpeg"),
            Container(height: 100, color: Colors.amber),
            Container(height: 100, color: Colors.green),
            Container(height: 100, color: Colors.yellow)
          ],
        ),
      ),
    );
  }
}
