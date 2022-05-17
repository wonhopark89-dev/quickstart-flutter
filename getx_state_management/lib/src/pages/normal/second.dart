import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
              // 기존
              // Navigator.of(context).pop();

              // getx
              Get.back();
            },
            child: const Text("뒤로 이동"),
          ),
          ElevatedButton(
            onPressed: () {
              // 기존 no history
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(
              //       builder: (_) => const Home(),
              //     ),
              //     (route) => false);

              // getx no history
              Get.offAll(const Home());
            },
            child: const Text("홈 이동"),
          )
        ],
      ),
    );
  }
}
