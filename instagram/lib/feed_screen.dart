import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widgets/post.dart';

// template: stless
class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(CupertinoIcons.photo_camera_solid),
          color: Colors.black87,
        ),
        middle: Text(
          '123가나다Instargram',
          style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: "Cafe24Shiningstar"),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                onPressed: null,
                icon: ImageIcon(
                  AssetImage("assets/images/actionbar_camera.png"),
                  color: Colors.redAccent,
                )),
            IconButton(
                onPressed: null,
                icon: ImageIcon(
                  AssetImage("assets/images/actionbar_camera.png"),
                  color: Colors.redAccent,
                ))
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 30,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}

// Scaffold 여러 옵션들이 기본적으로 들어있는 템플릿 개념
// Custom font 적용 시 pubspec 파일 yaml space 간격 꼭 확인 (2칸)
