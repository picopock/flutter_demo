import 'package:flutter/material.dart';
import './expansion_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '展开闭合案例',
      theme: ThemeData.dark(),
      home: ExpansionPanelListDemo(),
    );
  }
}
