import 'package:flutter/material.dart';
import 'package:getx_state_management/src/controller/count_controller_with_getx.dart';
import 'package:getx_state_management/src/controller/count_controller_with_provider.dart';
import 'package:getx_state_management/src/pages/state/with_getx.dart';
import 'package:getx_state_management/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetx());
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순상태관리"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: WithGetX()),
          Expanded(
            child: ChangeNotifierProvider<CountControllerWithProvider>(
              create: (_) => CountControllerWithProvider(),
              child: const WithProvider(),
            ),
          )
          // Expanded(child: WithProvider()),
        ],
      ),
    );
  }
}
