import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFEFEFEF)),
            child: Row(
              children: const [
                Icon(Icons.search),
                Text(
                  "검색",
                  style: TextStyle(fontSize: 15, color: Color(0xFF838383)),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _appbar(),
        ]),
      ),
    );
  }
}
