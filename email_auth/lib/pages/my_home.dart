import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_auth/pages/auth_page.dart';
import 'package:email_auth/provider/page_notifier.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key, required this.title}) : super(key: key);

  static const String pageName = 'MyHome';

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Provider.of<PageNotifier>(context, listen: false)
                    .showPage(AuthPage.pageName);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
