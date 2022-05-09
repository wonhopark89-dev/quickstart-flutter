import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/components/message_popup.dart';
import 'package:instagram_v2/src/controller/upload_controller.dart';
import 'package:instagram_v2/src/pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find(); // for nested

  RxInt pageIndex = 0.obs;

  GlobalKey<NavigatorState> searchPageNavigationKey = GlobalKey<NavigatorState>();

  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload(), binding: BindingsBuilder(() {
          Get.put(UploadController());
        }));
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) {
      // 하드웨어 뒤로가기 눌렀을때
      return;
    }
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    // print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1) {
      // print("exit!");
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: "종료하시겠습니까?",
          message: "",
          okCallback: () {
            exit(0);
          },
          cancelCallback: () {
            Get.back();
          },
        ),
      );
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        // serach 안에서 내부스택 쌓이는 걸 체크하는 방법
        var value = await searchPageNavigationKey.currentState!.maybePop();
        if (value) {
          return false; // willPopAction 에서는 아무것도 안하겠다
        }
      }

      // print("goto before page!");
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
