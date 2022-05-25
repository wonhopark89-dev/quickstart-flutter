import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/controller/count_controller_with_reactive.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithReactive());

    return Scaffold(
      appBar: AppBar(
        title: const Text("반응형 상태관리"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GetX", style: TextStyle(fontSize: 30)),

          // 방법 1 ( 더 좋은듯, 같은 값이면 렌더링안함, 잘 사용하면 리소스를 줄일 수 있음 )
          Obx(
            () => Text(
              "${Get.find<CountControllerWithReactive>().count.value}",
              style: const TextStyle(fontSize: 50),
            ),
          ),

          // 방법 2
          // GetX(
          //   builder: (_) {
          //     return Text(
          //       "${Get.find<CountControllerWithReactive>().count.value}",
          //       style: const TextStyle(fontSize: 50),
          //     );
          //   },
          // ),

          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithReactive>().increase();
            },
            child: const Text("+", style: TextStyle(fontSize: 30)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<CountControllerWithReactive>().putNumber(5);
            },
            child: const Text("5로 변경", style: TextStyle(fontSize: 30)),
          )
        ],
      ),
    );
  }
}
