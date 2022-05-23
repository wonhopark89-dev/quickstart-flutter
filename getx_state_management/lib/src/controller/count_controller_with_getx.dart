import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {
  int count = 0;
  void increase() {
    count++;
    update();
  }
}
