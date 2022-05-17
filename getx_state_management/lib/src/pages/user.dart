import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Column(
        children: [
          Text("${Get.parameters['uid']}"),
          Text("${Get.parameters['name']} 안녕하세요"),
          Text("${Get.parameters['age']}"),
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
