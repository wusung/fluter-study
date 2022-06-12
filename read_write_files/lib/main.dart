import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Reading and Writing Files',
    home: FlutterDemo(storage: CounterStorage()),
  ));
}

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  const FlutterDemo({
    Key? key,
    required this.storage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => FlutterDemoState();
}

class FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _increaseCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}
