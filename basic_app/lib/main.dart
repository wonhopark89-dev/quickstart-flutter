import 'package:basic_app/myPageSnackBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        // home: const MyCard(),
        // home: const MyPage(),
        home: const MyPageSnackBar());
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text('에비츄'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent[200],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ebichu_2.gif'),
                radius: 60,
              ),
            ),
            Divider(
              height: 30, // 위아래 합친 공간
              color: Colors.grey[800],
              thickness: 1,
            ),
            const Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'AAA',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'AAA POWER LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '30',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'using lightsaber',
                  style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                )
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'face hero tattoo',
                  style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                )
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'fire flames',
                  style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                )
              ],
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ebichu_1.jpeg'),
                backgroundColor: Colors.blueGrey,
                radius: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
