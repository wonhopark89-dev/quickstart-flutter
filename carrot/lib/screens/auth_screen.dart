import 'package:carrot/start/address_page.dart';
import 'package:carrot/start/intro_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  // viewportFraction : width 비율
  PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          IntroPage(_pageController),
          AddressPage(),
          Container(color: Colors.cyan),
          Container(color: Colors.accents[3])
        ],
      ),
    );
  }
}
