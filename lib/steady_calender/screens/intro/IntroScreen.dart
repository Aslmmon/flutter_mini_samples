import 'package:flutter/cupertino.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            5,
            (index) => Image.asset(
                  "images/iphone-valprop-$index@3x.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )),
      )
    ]);
  }
}
