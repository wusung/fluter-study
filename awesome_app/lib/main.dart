import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Fonts'),),
      body: const Center(
        child: Text(
          'Roboto Mono sample',
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      )
    );
  }
}
