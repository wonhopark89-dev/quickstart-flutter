import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: "도로명으로 검색",
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 24, minHeight: 24),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                icon: Icon(
                  CupertinoIcons.compass,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {},
                label: Text(
                  "현재 위치 찾기",
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
