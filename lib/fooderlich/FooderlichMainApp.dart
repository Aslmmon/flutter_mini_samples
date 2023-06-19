import 'package:flutter/material.dart';

import 'Home.dart';
import 'fooderlich_theme.dart';

void main() {
  runApp(const FooderLichApp());
}

class FooderLichApp extends StatelessWidget {
  const FooderLichApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: const Home(),
    );
  }
}
