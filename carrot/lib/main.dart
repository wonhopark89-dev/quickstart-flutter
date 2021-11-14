import 'package:carrot/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error occur while loading.");
          } else if (snapshot.hasData) {
            return TomatoApp();
          } else {
            return SplashScreen();
          }
          return SplashScreen();
        });
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber);
  }
}
