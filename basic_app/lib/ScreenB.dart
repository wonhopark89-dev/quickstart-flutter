import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen B'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Screen B',
              style: TextStyle(fontSize: 24),
            ),
            TextButton(
              onPressed: () {
                print('click text button');
              },
              child: Text(
                'text button',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              style: TextButton.styleFrom(
                  // backgroundColor: Colors.orange[200],
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                print('click elevated button');
              },
              child: Text(
                'elevated button',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print('click outlined button');
              },
              child: Text(
                'outline button',
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(color: Colors.greenAccent, width: 3),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                print('click text button icon');
              },
              icon: Icon(
                Icons.home,
                // Icons 컬러를 지정하지 않으면 Textbutton primary 색상을 따라감
                color: Colors.green,
              ),
              label: Text(
                'go to home',
                style: TextStyle(fontSize: 20),
              ),
              style: TextButton.styleFrom(primary: Colors.pink),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print('click elevated button icon');
              },
              icon: Icon(
                Icons.home,
                size: 30,
                // Icons 컬러를 지정하지 않으면 Textbutton primary 색상을 따라감
                //  color: Colors.green,
              ),
              label: Text(
                'go to home',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            ),
            OutlinedButton.icon(
              onPressed: null,
              // onPressed: () {},
              icon: Icon(
                Icons.home,
                // Icons 컬러를 지정하지 않으면 Textbutton primary 색상을 따라감
                // color: Colors.green,
              ),
              label: Text(
                'go to home',
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(300, 50),
                primary: Colors.black,
                onSurface: Colors.red, // 비활성화 되었을 때 스타일
                // backgroundColor: Colors.teal[300],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                ElevatedButton(onPressed: () {}, child: Text('AAAAAAAA')),
                ElevatedButton(onPressed: () {}, child: Text('BBBBBBBB'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
