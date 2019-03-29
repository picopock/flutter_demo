import 'package:flutter/material.dart';
import './frosted_glass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '毛玻璃效果',
        home: Scaffold(body: FrostedGlass()),
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ));
  }
}
