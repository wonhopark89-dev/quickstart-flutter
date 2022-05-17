import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
      ),
      body: Column(
        children: [
          Text("${Get.arguments}"),
          // Text("${Get.arguments['name']} : ${Get.arguments['age']}"),
          Text("${(Get.arguments as User).name} : ${(Get.arguments as User).age}"),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("뒤로 이동"),
          ),
        ],
      ),
    );
  }
}
