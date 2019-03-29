import 'package:flutter/material.dart';
import './bottom_app_bar_demo.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      // 自定义主题样本
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: BottomAppBarDemo(),
    );
  }
}
