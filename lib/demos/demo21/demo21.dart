import 'package:flutter/material.dart';

class Demo21 extends StatefulWidget {
  _Demo21State createState() => _Demo21State();
}

class _Demo21State extends State<Demo21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Hello world',
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Hello world',
            textScaleFactor: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
              height: 2.5,
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'bold',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' world ',
                  style: TextStyle(color: Colors.green),
                ),
                TextSpan(text: '!'),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Home: '),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  // recognizer: _recognizer,
                ),
              ],
            ),
          ),

          ///
          /// 在widget树中，文本的样式默认是可以被继承的，因此，如果在widget树的某一个节点处设置一个默认的文本样式，
          /// 那么该节点的子树中所有文本都会默认使用这个样式
          ///
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.right,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Hello world!'),
                Text('I am Jack'),
                Text(
                  'I am Jack',
                  style: TextStyle(
                    inherit: false,
                    color: Colors.grey,
                  ),
                ),

                ///
                /// 按钮
                ///
                Center(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('normal'),
                        onPressed: () => {},
                      ),
                      FlatButton(
                        child: Text('normal'),
                        onPressed: () => {},
                      ),
                      OutlineButton(
                        child: Text('normal'),
                        onPressed: () => {},
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.thumb_up,
                        ),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark, // 设置为dark 时文字颜色为浅色
                        splashColor: Colors.grey, // 点击时波纹颜色
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () => {},
                        child: Text('custom button'),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
