import 'package:flutter/material.dart';
import './search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '搜索条',
      theme: ThemeData.light(),
      home: SearchBar(),
    );
  }
}
