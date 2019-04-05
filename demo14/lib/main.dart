import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '圆角',
      home: Scaffold(
        appBar: AppBar(
          title: Text('圆角'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('ClipOval：'),
                ClipOval(
                  child: Image.network(
                    'http://img.52z.com/upload/news/image/20180509/20180509085548_70320.jpg',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                Text('CircleAvatar：'),
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage:
                      AssetImage('assets/images/20170118163218_28szy.jpeg'),
                ),
                Text('BoxDecoration BoxShape.circle：'),
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/20170118163218_28szy.jpeg'),
                    ),
                  ),
                ),
                Text('圆角头像 ClipRRect：'),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Image.asset('assets/images/20170118163218_28szy.jpeg'),
                ),
                Text('圆角头像 BoxDecoration BoxShape.rectangle：'),
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/20170118163218_28szy.jpeg')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
