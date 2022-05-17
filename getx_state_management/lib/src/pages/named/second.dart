import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {
  const SecondNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("뒤로 이동"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/");
            },
            child: const Text("홈 이동"),
          )
        ],
      ),
    );
  }
}
