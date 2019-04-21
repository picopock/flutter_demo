import 'package:flutter/material.dart';
import './widgets/turn_box.dart';

import './widgets/Gomoku.dart';
import './widgets/gradient_circular_progress_indicator.dart';

class CustomWidget extends StatefulWidget {
  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义widget'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                '通过组合现有Widget实现自定义Widget',
                style: TextStyle(fontSize: 24.0),
              ),
              TurnBox(
                turns: _turns,
                speed: 500,
                child: Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ),
              TurnBox(
                turns: _turns,
                speed: 1000,
                child: Icon(
                  Icons.refresh,
                  size: 150.0,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _turns += 0.2;
                  });
                },
                child: Text('顺时针旋转1/5圈'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _turns -= 0.2;
                  });
                },
                child: Text('逆时针旋转1/5圈'),
              ),
              Text('CustomPaint 与 Canvas'),
              Gomoku(),
              Text('圆形渐变进度条'),
              GradientCircularProgressPage(),
            ],
          ),
        ),
      ),
    );
  }
}
