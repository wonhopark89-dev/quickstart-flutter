import 'package:flutter/material.dart';

// template: stless
class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('123가나다Instargram'),
        titleTextStyle: TextStyle(fontSize: 10),
      ),
      body: Center(
        child: Text(
          "Center~~123123456",
          style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
              fontFamily: "Cafe24Shiningstar"),
        ),
      ),
    );
  }
}

// Scaffold 여러 옵션들이 기본적으로 들어있는 템플릿 개념
// Custom font 적용 시 pubspec 파일 yaml space 간격 꼭 확인 (2칸)
