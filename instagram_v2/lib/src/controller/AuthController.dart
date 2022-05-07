import 'package:get/get.dart';
import 'package:instagram_v2/src/models/instagram_user.dart';
import 'package:instagram_v2/src/repository/user_repository.dart';

class AuthController extends GetxController {
  Future<IUser?> loginUser(String uid) async {
    // todo : 디비 조회
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }
}
