import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/app.dart';
import 'package:instagram_v2/src/controller/AuthController.dart';
import 'package:instagram_v2/src/models/instagram_user.dart';
import 'package:instagram_v2/src/pages/login.dart';
import 'package:instagram_v2/src/pages/signup_page.dart';

// class Root extends StatelessWidget {
class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          // todo : 내부 파이어베이스 데이터
          // Get.find<AuthController>().loginUser(user.data!.uid);
          return FutureBuilder<IUser?>(
              future: controller.loginUser(user.data!.uid),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return const App();
                } else {
                  return Obx(() => controller.user.value.uid != null
                      ? const App()
                      : SignUpPage(uid: user.data!.uid));
                }
              }));
        } else {
          return const Login();
        }
      },
    );
  }
}
