import 'package:get/get.dart';
import 'package:instagram_v2/src/pages/Upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}
