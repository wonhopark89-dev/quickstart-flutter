import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final int index;

  const Post(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/200/300",
    );
  }
}
