import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/pages/search/search_focus.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    // 100 개 가정
    for (var i = 0; i < 100; i++) {
      // var gi = i % 3; // 앞에서 사이즈 큰지를 확인하지 못함
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        //  홀짝으로 2배 높이 주는 로직
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }

    // print(groupIndex);
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchFocus(),
                  ));

              // Navigator 안쪽이라 이방식을 쓰면 Nested 가 안됨, Bottom 이 살아 있지 않음
              // Get.to(() => const SearchFocus());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFFEFEFEF)),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    "검색",
                    style: TextStyle(fontSize: 15, color: Color(0xFF838383)),
                  )
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                  child: CachedNetworkImage(
                      imageUrl:
                          "http://m.ebichu.co.kr/web/product/medium/20200227/9dc69754e4800cf4332225fb6fcaf37b.png",
                      fit: BoxFit.cover),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _appbar(),
          Expanded(child: _body()),
        ]),
      ),
    );
  }
}
