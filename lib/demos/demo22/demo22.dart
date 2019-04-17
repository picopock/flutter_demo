import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demo22 extends StatelessWidget {
  static TextStyle textStyle = TextStyle(
    background: Paint()..color = Colors.grey[300],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片 和 Icon'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'ImageProvider',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'ImageProvider',
                    style: textStyle,
                  ),
                  TextSpan(text: '是一个抽象类，主要定义了图片数据获取的接口'),
                  TextSpan(
                    text: 'load()',
                    style: textStyle,
                  ),
                  TextSpan(text: '，从不同的数据源获取图片需要实现不同的 '),
                  TextSpan(
                    text: 'ImageProvider',
                    style: textStyle,
                  ),
                  TextSpan(text: '，如'),
                  TextSpan(
                    text: 'AssetImage',
                    style: textStyle,
                  ),
                  TextSpan(text: '是实现了从'),
                  TextSpan(
                    text: 'Asset',
                    style: textStyle,
                  ),
                  TextSpan(text: '中加载图片的'),
                  TextSpan(
                    text: 'ImageProvider',
                    style: textStyle,
                  ),
                  TextSpan(text: '，而'),
                  TextSpan(
                    text: 'NetworkImage',
                    style: textStyle,
                  ),
                  TextSpan(text: '实现了从网络加载图片的'),
                  TextSpan(
                    text: 'ImageProvider',
                    style: textStyle,
                  ),
                  TextSpan(text: '。'),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/images/20170118163218_28szy.jpeg'),
              width: 300.0,
              height: 300.0,
            ),
            Image.asset(
              'assets/images/20170118163218_28szy.jpeg',
              width: 200.0,
              height: 200.0,
            ),
            Image(
              image: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
              width: 150.0,
              height: 150.0,
            ),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 100.0,
              height: 100.0,
              color: Colors.red,
              colorBlendMode: BlendMode.difference, //colorBlendMode指定混合模式
            )
          ],
        ),
      ),
    );
  }
}
