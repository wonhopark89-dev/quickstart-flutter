import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carrot/states/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: false,
      title: Text("우리동네", style: Theme.of(context).appBarTheme.titleTextStyle),
      actions: [
        IconButton(
            onPressed: () {
              context.read<UserProvider>().setUserAuth(false);
            },
            icon: Icon(CupertinoIcons.nosign)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.text_justify))
      ],
    ));
  }
}
