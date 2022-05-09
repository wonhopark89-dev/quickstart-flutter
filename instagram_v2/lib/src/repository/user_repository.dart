import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_v2/src/models/instagram_user.dart';

class UserRepository {
  static Future<IUser?> loginUserByUid(String uid) async {
    var data = await FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: uid).get();

    if (data.size == 0) {
      return null;
    } else {
      // print(data.docs.first.data());
      return IUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(IUser user) async {
    try {
      await FirebaseFirestore.instance.collection("users").add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
