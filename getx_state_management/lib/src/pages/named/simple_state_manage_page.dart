import 'package:flutter/material.dart';
import 'package:getx_state_management/src/pages/state/with_getx.dart';
import 'package:getx_state_management/src/pages/state/with_provider.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순상태관리"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(child: WithGetX()),
          Expanded(child: WithProvider()),
        ],
      ),
    );
  }
}
