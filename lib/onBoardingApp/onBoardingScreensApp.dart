import 'package:flutter/material.dart';

class OnBoardingScreenApp extends StatefulWidget {
  const OnBoardingScreenApp({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenApp> createState() => _OnBoardingScreenAppState();
}

class _OnBoardingScreenAppState extends State<OnBoardingScreenApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("welcome")),
      ),
    );
  }
}
