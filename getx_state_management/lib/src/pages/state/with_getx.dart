import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/src/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);

  final CountControllerWithGetx _countControllerWithGetx = Get.put(CountControllerWithGetx());

  // context 종속없이 분리가능
  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        // Get.find<CountControllerWithGetx>().increase();
        _countControllerWithGetx.increase();
      },
      child: const Text(
        "+",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GetX", style: TextStyle(fontSize: 30)),
          GetBuilder<CountControllerWithGetx>(
            builder: ((controller) {
              return Text(
                "${controller.count}",
                style: const TextStyle(fontSize: 50),
              );
            }),
          ),
          _button(),
        ],
      ),
    );
  }
}
