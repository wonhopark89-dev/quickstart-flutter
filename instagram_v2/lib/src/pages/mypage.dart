import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instagram_v2/src/components/avatar_widget.dart';
import 'package:instagram_v2/src/components/image_data.dart';
import 'package:instagram_v2/src/components/user_card.dart';
import 'package:instagram_v2/src/controller/AuthController.dart';
import 'package:instagram_v2/src/controller/Mypage_controller.dart';

class MyPage extends GetView<MypageController> {
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
          const SizedBox(
            height: 10,
          ),
          const Text(
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
          const SizedBox(width: 8),
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

  Widget _discoverPeople() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Discover People",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: List.generate(
              10,
              (index) => UserCard(
                  userId: '이름$index', description: '이름$index님이 팔로우 합니다'),
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _tabMenu() {
    return TabBar(
        controller: controller.tabController,
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        tabs: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ImageData(IconsPath.gridViewOn),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ImageData(IconsPath.gridViewOff),
          )
        ]);
  }

  Widget _tabView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 50,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1),
      itemBuilder: (BuildContext context, int index) {
        return Container(color: Colors.amberAccent);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AuthController.to.user.value.nickname!,
          style: const TextStyle(
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
            _discoverPeople(),
            const SizedBox(height: 10),
            _tabMenu(),
            _tabView(),
          ],
        ),
      ),
    );
  }
}
