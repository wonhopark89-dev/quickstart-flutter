import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_v2/src/components/image_data.dart';
import 'package:instagram_v2/src/controller/bottomNavController.dart';
import 'package:instagram_v2/src/pages/active_history.dart';
import 'package:instagram_v2/src/pages/home.dart';
import 'package:instagram_v2/src/pages/mypage.dart';
import 'package:instagram_v2/src/pages/search.dart';
import 'package:instagram_v2/src/pages/upload.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          // backgroundColor: Colors.red,
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller.searchPageNavigationKey,
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => const Search(),
                  );
                },
              ),
              const Upload(),
              const ActiveHistory(),
              const MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff), activeIcon: ImageData(IconsPath.homeOn), label: "home"),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff), activeIcon: ImageData(IconsPath.searchOn), label: "home"),
                BottomNavigationBarItem(icon: ImageData(IconsPath.uploadIcon), label: "home"),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff), activeIcon: ImageData(IconsPath.activeOn), label: "home"),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                    ),
                    label: "avatar"),
              ]),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
