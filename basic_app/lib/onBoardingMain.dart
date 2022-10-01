import 'package:basic_app/onboarding.dart';
import 'package:flutter/material.dart';

class MyOnBoardingApp extends StatelessWidget {
  const MyOnBoardingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class MyOnboardingPage extends StatelessWidget {
  const MyOnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'main screen',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => OnBoardingPage(),
                  ),
                );
              },
              child: Text('go to onboarding screen'),
            ),
          ],
        ),
      ),
    );
  }
}
