import 'package:carrot/start/address_page.dart';
import 'package:carrot/start/auth_page.dart';
import 'package:carrot/start/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  // viewportFraction : width 비율
  PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Provider<PageController>.value(
      value: _pageController,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          // physics: NeverScrollableScrollPhysics(),
          children: [
            IntroPage(),
            AddressPage(),
            AuthPage(),
          ],
        ),
      ),
    );
  }
}
