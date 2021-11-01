import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final int index;

  const Post(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
      height: 100,
    );
  }
}
