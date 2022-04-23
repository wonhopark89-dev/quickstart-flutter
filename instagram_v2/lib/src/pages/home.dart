import 'package:flutter/material.dart';
import 'package:instagram_v2/src/components/avatar_widget.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        const AvatarWidget(
            size: 65,
            thumbPath:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxzfjLcrtvrt4qwdPFoVYbshPcWLhh8Xve2w&usqp=CAU",
            type: AvatarType.TYPE2),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: const Center(
              child: Text(
                "+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          _myStory(),
          ...List.generate(
            50,
            (index) => const AvatarWidget(
                thumbPath:
                    "http://m.ebichu.co.kr/web/product/medium/20200227/9dc69754e4800cf4332225fb6fcaf37b.png",
                type: AvatarType.TYPE1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 250,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(children: [
        _storyBoardList(),
      ]),
    );
  }
}
