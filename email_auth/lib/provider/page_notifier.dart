import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_auth/pages/auth_page.dart';

class PageNotifier extends ChangeNotifier {
  String? _currentPage = AuthPage.pageName;

  PageNotifier() {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          showPage(AuthPage.pageName);
        } else {
          goToMain();
        }
      },
    );
  }

  String? get curPage => _currentPage;

  void goToMain() {
    _currentPage = null;
    notifyListeners();
  }

  void showPage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}
