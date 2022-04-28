import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> {
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
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
