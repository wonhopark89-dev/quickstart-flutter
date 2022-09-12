import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar icon menu'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            print('menu button is clicked');
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('shopping cart is clicked');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              print('search is clicked');
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
