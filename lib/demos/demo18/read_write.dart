import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ReadAndWriteFile extends StatefulWidget {
  @override
  _ReadAndWriteFileState createState() => _ReadAndWriteFileState();
}

class _ReadAndWriteFileState extends State<ReadAndWriteFile> {
  int _counter;

  @override
  void initState() {
    super.initState();

    _readCounter().then((int counter) {
      setState(() {
        _counter = counter;
      });
    });
  }

  Future<File> _getLocalFile() async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return File('$appDocPath/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    File file = await _getLocalFile();
    await file.writeAsString(_counter.toString());
  }

  Future<Null> _subtractCounter() async {
    setState(() {
      _counter--;
    });
    File file = await _getLocalFile();
    await file.writeAsString(_counter.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('读写文件'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                  'Button tapped ${_counter ?? '0'} time${_counter == 1 ? '' : 's'}'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add_circle),
                    iconSize: 60.0,
                  ),
                  IconButton(
                    onPressed: _subtractCounter,
                    icon: Icon(Icons.remove_circle),
                    iconSize: 60.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }
}
