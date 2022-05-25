import "package:get/get.dart";

class CountControllerWithReactive {
  RxInt count = 0.obs;
  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }
}
