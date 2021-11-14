import 'package:carrot/splash_screen.dart';
import 'package:flutter/material.dart';
import "package:carrot/uilts/logger.dart";

void main() {
  logger.d("Start App");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: _splashLoadWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print("error occur while loading.");
      return Text("Error occur");
    } else if (snapshot.hasData) {
      return TomatoApp();
    } else {
      return SplashScreen();
    }
  }
}

class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber);
  }
}
