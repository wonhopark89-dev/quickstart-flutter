import 'package:flutter/material.dart';

class MyPageSnackBar extends StatelessWidget {
  const MyPageSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext ctx) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text("Hello"),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                'Show me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
