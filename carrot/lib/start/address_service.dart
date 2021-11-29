import 'package:carrot/uilts/logger.dart';
import "package:carrot/constants/keys.dart";
import 'package:dio/dio.dart';

class AddressService {
  void dioTest() async {
    var response =
        await Dio().get("https://randomuser.me/api/").catchError((e) {
      logger.e(e.error);
    });
    logger.d(response);
  }
}
