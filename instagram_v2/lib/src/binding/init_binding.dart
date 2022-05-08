import 'package:get/get.dart';
import 'package:instagram_v2/src/controller/AuthController.dart';
import 'package:instagram_v2/src/controller/BottomNavController.dart';
import 'package:instagram_v2/src/controller/Mypage_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }

  static additionalBinding() {
    Get.put(MypageController(), permanent: true);
  }
}
