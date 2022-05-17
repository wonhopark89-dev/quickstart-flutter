import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/pages/normal/first.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("라우트 관리 홈"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // 기존
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => const FirstPage(),
              //   ),
              // );

              // Getx
              Get.to(const FirstPage());
            },
            child: const Text("일반적인 라우트"),
          ),
          ElevatedButton(
            onPressed: () {
              // 기존
              // Navigator.of(context).pushNamed("/first");

              // Getx
              Get.toNamed("/first");
            },
            child: const Text("Named 라우트"),
          )
        ],
      )),
    );
  }
}
