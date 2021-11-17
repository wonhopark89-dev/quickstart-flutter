import 'package:beamer/beamer.dart';
import 'package:carrot/router/locations.dart';
import 'package:carrot/screens/auth_screen.dart';
import 'package:carrot/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import "package:carrot/uilts/logger.dart";

// 글로벌로 설정해야함 ( 라우팅 관련 Beamer 에 위임 )
// 로그인 안되어있으면(false) AuthScreen 으로
final _routerDelegate = BeamerDelegate(guards: [
  BeamGuard(
      pathBlueprints: ["/"],
      check: (context, location) {
        return false;
      },
      showPage: BeamPage(child: AuthScreen()))
], locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

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
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
