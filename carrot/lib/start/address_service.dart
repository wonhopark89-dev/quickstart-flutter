import 'package:carrot/data/address_model.dart';
import 'package:carrot/uilts/logger.dart';
import "package:carrot/constants/keys.dart";
import 'package:dio/dio.dart';

class AddressService {
  // void dioTest() async {
  //   var response =
  //       await Dio().get("https://randomuser.me/api/").catchError((e) {
  //     logger.e(e.error);
  //   });
  //   logger.d(response);
  // }

  Future<AddressModel> searchAddressByStr(String text) async {
    final formData = {
      "key": VWORLD_KEY,
      "request": "search",
      "type": "ADDRESS",
      "category": "ROAD",
      "query": text,
      "size": 30,
    };

    final response = await Dio()
        .get("http://api.vworld.kr/req/search", queryParameters: formData)
        .catchError((e) {
      logger.e(e.mesage);
    });
    logger.d(response.data is Map);
    // logger.d(response.data["response"]["result"]);
    AddressModel addressModel =
        AddressModel.fromJson(response.data["response"]);
    return addressModel;
  }

  Future<void> findAddressByCoordinate(
      {required double long, required double lat}) async {
    final List<Map<String, dynamic>> formDatas = <Map<String, dynamic>>[];

    formDatas.add({
      "key": VWORLD_KEY,
      "service": "address",
      "request": "getAddress",
      "point": "$long,$lat",
      "type": "BOTH",
    });

    formDatas.add({
      "key": VWORLD_KEY,
      "service": "address",
      "request": "getAddress",
      "point": "${long - 0.01},$lat",
      "type": "BOTH",
    });

    formDatas.add({
      "key": VWORLD_KEY,
      "service": "address",
      "request": "getAddress",
      "point": "${long + 0.01},$lat",
      "type": "BOTH",
    });

    formDatas.add({
      "key": VWORLD_KEY,
      "service": "address",
      "request": "getAddress",
      "point": "$long,${lat - 0.01}",
      "type": "BOTH",
    });

    formDatas.add({
      "key": VWORLD_KEY,
      "service": "address",
      "request": "getAddress",
      "point": "$long,${lat + 0.01}",
      "type": "BOTH",
    });

    for (Map<String, dynamic> formData in formDatas) {
      final response = await Dio()
          .get("http://api.vworld.kr/req/address", queryParameters: formData)
          .catchError((e) {
        logger.e(e.mesage);
      });
      logger.d(response);
    }

    return;
  }
}
