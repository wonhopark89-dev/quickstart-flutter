import 'package:get/get.dart';
import 'package:instagram_v2/src/controller/authController.dart';
import 'package:instagram_v2/src/controller/bottomNavController.dart';
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
