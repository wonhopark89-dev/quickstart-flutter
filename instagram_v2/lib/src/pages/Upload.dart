import 'package:flutter/material.dart';
import 'package:instagram_v2/src/components/image_data.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {},
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: ImageData(IconsPath.closeImage))),
        title: const Text(
          "New Post",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ImageData(
                    IconsPath.nextImage,
                    width: 50,
                  ))),
        ],
      ),
    );
  }
}
