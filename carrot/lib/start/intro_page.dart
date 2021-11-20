import 'package:carrot/uilts/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  void onButtonClick() {
    logger.d("on button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("당근마켓",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            ExtendedImage.asset("assets/imgs/carrot_intro.png"),
            Text(
              "우리동네 중고 직거래 마켓",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
  }
}
