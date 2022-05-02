import 'package:flutter/material.dart';
import 'package:instagram_v2/src/components/avatar_widget.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  Widget _statisticsOne(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _information() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AvatarWidget(
                thumbPath: "http://cogulmars.cafe24.com/img/04about_img04.png",
                type: AvatarType.TYPE3,
                size: 80,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _statisticsOne("Post", 15)),
                    Expanded(child: _statisticsOne("Followers", 999)),
                    Expanded(child: _statisticsOne("Following", 500)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "안녕하세요 자기소개 페이지 입니다. 구독과 좋아요",
            style: TextStyle(fontSize: 13, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: const Color(0xffdedede))),
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffdedede),
              ),
              color: const Color(0xFFEFEFEF),
            ),
            child: ImageData(IconsPath.addFriend),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "내정보",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: ImageData(
              IconsPath.uploadIcon,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {},
              child: ImageData(
                IconsPath.menuIcon,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _information(),
            _menu(),
          ],
        ),
      ),
    );
  }
}
