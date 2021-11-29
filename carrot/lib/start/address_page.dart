import 'package:carrot/constants/common_size.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address_service.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _addressController,
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
          TextButton.icon(
            icon: Icon(
              CupertinoIcons.compass,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              final text = _addressController.text;
              if (text.isNotEmpty) {
                AddressService().searchAddressByStr(text);
              }
            },
            label: Text(
              "현재 위치 찾기",
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: common_padding),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.image),
                  trailing:
                      ExtendedImage.asset("assets/imgs/carrot_bunny.jpeg"),
                  title: Text("address $index"),
                  subtitle: Text("sub $index"),
                );
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
