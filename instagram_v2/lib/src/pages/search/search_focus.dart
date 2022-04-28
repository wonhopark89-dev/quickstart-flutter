import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFE4E4E4))),
        ),
        child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne("인기"),
              _tabMenuOne("계정"),
              _tabMenuOne("오디오"),
              _tabMenuOne("태그"),
              _tabMenuOne("장소")
            ]),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xFFEFEFEF)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "검색",
                contentPadding: EdgeInsets.only(left: 15, top: 8, bottom: 8),
                isDense: true),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
