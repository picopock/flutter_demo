import 'package:flutter/material.dart';
import './pages.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '渐隐渐现的路由动画效果',
      // 自定义主题样本
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstPage(),
    );
  }
}
