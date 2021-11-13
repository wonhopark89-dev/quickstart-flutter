import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExtendedImage.asset("assets/imgs/pengsoo.jpeg"),
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
