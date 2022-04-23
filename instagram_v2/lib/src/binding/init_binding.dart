import 'package:get/get.dart';
import 'package:instagram_v2/src/controller/BottomNavController.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
