import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Named Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/second");
                  // Get.offNamed("/second"); // 현재 페이지 제거 후 이동
                },
                child: const Text("다음 페이지"))
          ],
        ),
      ),
    );
  }
}
