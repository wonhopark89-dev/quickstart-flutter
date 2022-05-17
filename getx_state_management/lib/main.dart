import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/home.dart';
import 'package:getx_state_management/src/pages/named/first.dart';
import 'package:getx_state_management/src/pages/named/second.dart';
import 'package:getx_state_management/src/pages/next.dart';
import 'package:getx_state_management/src/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
      initialRoute: "/",
      // routes: {
      //   // 기존
      //   "/": (context) => const Home(),
      //   "/first": (context) => const FirstNamedPage(),
      //   "/second": (context) => const SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: "/", page: () => const Home(), transition: Transition.zoom),
        GetPage(name: "/first", page: () => const FirstNamedPage(), transition: Transition.zoom),
        GetPage(name: "/second", page: () => const SecondNamedPage(), transition: Transition.zoom),
        GetPage(name: "/next", page: () => const NextPage()),
        GetPage(name: "/user/:uid", page: () => const UserPage())
      ],
    );
  }
}
