import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'brick_breaker.dart';


void main() {
  final game = BrickBreaker();

  runApp(GameWidget(game: game));
}

class BrickApp extends StatelessWidget {
  const BrickApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      // 5
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const Text("Hello"),
    );
  }
}
