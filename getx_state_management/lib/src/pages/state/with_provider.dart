import 'package:flutter/material.dart';
import 'package:getx_state_management/src/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Provider", style: TextStyle(fontSize: 30)),
          // 이 아래 줄은 비효율적
          // Text("${Provider.of<CountControllerWithProvider>(context).count} "),
          // Consumer 쪽 return 만 재 빌드 되도록 ( listen :false )
          Consumer<CountControllerWithProvider>(builder: (_, snapshot, child) {
            return Text(
              "${snapshot.count}",
              style: const TextStyle(fontSize: 50),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Provider.of<CountControllerWithProvider>(context, listen: false).increase();
            },
            child: const Text(
              "+",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
