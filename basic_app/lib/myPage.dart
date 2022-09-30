import 'package:basic_app/secondPage.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('appbar icon menu'),
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     print('menu button is clicked');
        //   },
        //   icon: const Icon(Icons.menu),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              print('shopping cart is clicked');
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              print('search is clicked');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (routeContext) => SecondPage(),
                ),
              );
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/ebichu_1.jpeg'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/ebichu_1.jpeg'),
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/ebichu_1.jpeg'),
                // )
              ],
              accountName: const Text('Ebichu'),
              accountEmail: const Text('edi@chu'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blueGrey[800],
              ),
              title: const Text('Home'),
              trailing: const Icon(Icons.add),
              onTap: () {
                print('home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey[800],
              ),
              title: const Text('Setting'),
              trailing: const Icon(Icons.add),
              onTap: () {
                print('Setting is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.blueGrey[800],
              ),
              title: const Text('Q&A'),
              trailing: const Icon(Icons.add),
              onTap: () {
                print('Q&A is clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}
