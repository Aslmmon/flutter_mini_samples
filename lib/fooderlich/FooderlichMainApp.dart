import 'package:flutter/material.dart';

void main() {
  runApp(const FooderLichApp());
}

class FooderLichApp extends StatelessWidget {
  const FooderLichApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(title: const Text('Fooderlich')),
          body: const Center(
            child: Text("Let\'s get cooking 👩‍🍳"),
          )),
    );
  }
}
