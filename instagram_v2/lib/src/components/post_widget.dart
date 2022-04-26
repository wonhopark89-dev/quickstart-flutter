import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_v2/src/components/avatar_widget.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AvatarWidget(
              size: 40,
              nickname: "에비츄야",
              thumbPath:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxzfjLcrtvrt4qwdPFoVYbshPcWLhh8Xve2w&usqp=CAU",
              type: AvatarType.TYPE3),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-xUKH199jiP5MwUMvF7IrAQy9BQpWba0Tj_6KpLxuDYXJXEKP0eGzIRcEVUWLAfk8bwA&usqp=CAU");
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                IconsPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.replyIcon,
                width: 65,
              ),
              const SizedBox(
                width: 15,
              ),
              ImageData(
                IconsPath.directMessage,
                width: 65,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 65,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      // color: Colors.red,
      child: Column(children: [
        _header(),
        const SizedBox(height: 15),
        _image(),
        const SizedBox(height: 15),
        _infoCount(),
        // _infoDescription(),
        // _replyTextBtn(),
        // _dateAgo(),
      ]),
    );
  }
}
