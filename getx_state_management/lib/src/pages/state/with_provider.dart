import 'package:flutter/material.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Provider", style: TextStyle(fontSize: 30)),
          const Text("0", style: TextStyle(fontSize: 50)),
          ElevatedButton(
            onPressed: () {},
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
