import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';
    return MaterialApp(
      title: title,
      home: MaterialApp(
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Album'),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Phone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
