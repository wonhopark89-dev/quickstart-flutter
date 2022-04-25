import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 }

class AvatarWidget extends StatelessWidget {
  final bool? hasStory;
  final String thumbPath;
  final String? nickname;
  final AvatarType type;
  final double? size;

  const AvatarWidget(
      {Key? key,
      this.hasStory,
      required this.thumbPath,
      this.nickname,
      required this.type,
      this.size = 60})
      : super(key: key);

  Widget type1Widget() {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.orange, Colors.pink, Colors.black]),
          shape: BoxShape.circle),
      child: type2Widget(),
    );
  }

  Widget type2Widget() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
          width: size,
          height: size,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget type3Widget() {
    return Row(
      children: [
        type1Widget(),
        Text(
          nickname ?? "",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.TYPE1:
        return type1Widget();
      case AvatarType.TYPE2:
        return type2Widget();
      case AvatarType.TYPE3:
        return type3Widget();
    }
  }
}
