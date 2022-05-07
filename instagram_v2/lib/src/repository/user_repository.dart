import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future<void> loginUserByUid(String uid) async {
    FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get();
  }
}
