import 'package:basic_app/onBoardingMain.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Welcome my app',
            body: 'this is the first page',
            image: Image.asset('assets/ebichu_1.jpeg'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Welcome my app',
            body: 'this is the second page',
            image: Image.asset('assets/ebichu_1.jpeg'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Welcome my app',
            body: 'this is the last page',
            image: Image.asset('assets/ebichu_1.jpeg'),
            decoration: getPageDecoration()),
      ],
      done: Text('done'),
      onDone: () {
        // 뒤로가기 안 생기도록
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => MyOnboardingPage(),
          ),
        );
      },
      next: Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        activeColor: Colors.cyanAccent,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      curve: Curves.bounceInOut,
    );
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
    );
  }
}
