import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_v2/src/binding/init_binding.dart';
import 'package:instagram_v2/src/models/instagram_user.dart';
import 'package:instagram_v2/src/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    // todo : 디비 조회
    var userData = await UserRepository.loginUserByUid(uid);
    if (userData != null) {
      // 처음부터 바인딩 할 필요없기 때문에
      InitBinding.additionalBinding();
      user(userData);
    }
    return userData;
  }

  void signup(IUser signupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSignup(signupUser);
    } else {
      // 확장자 벨리데이션
      var task = uploadXfile(thumbnail,
          '${signupUser.uid}/profile.${thumbnail.path.split(".").last}');
      task.snapshotEvents.listen((event) async {
        // event.bytesTransferred
        print('Transferred: ${event.bytesTransferred}');
        // 업로드 후에, 업로드한 반큼 용량이 전송되었는지, 성공이였는지 체크
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL(); // CDN
          // mutable, immutable
          var updateUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updateUserData);
        }
      });
    }
  }

  UploadTask uploadXfile(XFile file, String filename) {
    var f = File(file.path);
    var ref = FirebaseStorage.instance.ref().child("users").child(filename);
    final metaData = SettableMetadata(
        contentType: "image/jpeg",
        customMetadata: {'picked-file-path': file.path});
    return ref.putFile(f, metaData);
    // usrs/{uid}/profile.jpg or png
  }

  void _submitSignup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      // user(signupUser);
      loginUser(signupUser.uid!);
    }
  }
}
