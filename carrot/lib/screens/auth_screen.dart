import 'package:carrot/start/intro_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          IntroPage(),
          Container(color: Colors.blueAccent),
          Container(color: Colors.cyan),
          Container(color: Colors.accents[3])
        ],
      ),
    );
  }
}
