import 'package:flutter/material.dart';

class OnBoardingScreenApp extends StatelessWidget {
  const OnBoardingScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("welcome")),
      ),
    );
  }
}
