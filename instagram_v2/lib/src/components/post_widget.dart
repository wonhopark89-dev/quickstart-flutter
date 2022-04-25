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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      color: Colors.red,
      child: Column(children: [
        _header(),
        // _infoCount(),
        // _infoDescription(),
        // _replyTextBtn(),
        // _dateAgo(),
      ]),
    );
  }
}
