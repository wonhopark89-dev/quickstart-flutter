import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/pages/named/simple_state_manage_page.dart';
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
          ),
          ElevatedButton(
            onPressed: () {
              // Arguments 로 넘길 수 있는 것들 ( String, Map, Class.. )
              // Get.toNamed("/next", arguments: "파라미터");
              // Get.toNamed("/next", arguments: {"name": "펭수", "age": 10});
              Get.toNamed("/next", arguments: User(name: "펭수2", age: 11));
            },
            child: const Text("Arguments 전달"),
          ),
          ElevatedButton(
            onPressed: () {
              // Get.toNamed("user/12345");
              Get.toNamed("/user/12345?name=펭수3&age=13");
            },
            child: const Text("동적 url"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const SimpleStateManagePage());
            },
            child: const Text("단순 상태 관리"),
          )
        ],
      )),
    );
  }
}

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}
