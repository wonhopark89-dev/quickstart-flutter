import 'package:carrot/constants/common_size.dart';
import 'package:carrot/uilts/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  void onButtonClick() {
    controller.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    logger.d("on button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        final imgSize = size.width - 32;
        final sizeOfPosImg = imgSize * 0.1;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: common_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("당근마켓",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                SizedBox(
                  width: imgSize,
                  height: imgSize,
                  child: Stack(
                    children: [
                      ExtendedImage.asset("assets/imgs/carrot_intro.png"),
                      Positioned(
                        child: ExtendedImage.asset(
                            "assets/imgs/carrot_bunny.jpeg"),
                        width: sizeOfPosImg,
                        height: sizeOfPosImg,
                        left: imgSize * 0.45,
                        top: imgSize * 0.45,
                      )
                    ],
                  ),
                ),
                Text(
                  "우리동네 중고 직거래 마켓",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "당근마켓은 동네 직거래 마켓이예요\n내 동네를 설정하고 시작해보세요.",
                  style: TextStyle(fontSize: 16),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: onButtonClick,
                      child: Text(
                        "내 동네 설정하고 시작하기",
                        style: Theme.of(context).textTheme.button,
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
