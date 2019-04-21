import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class EventAndNotificationPage extends StatefulWidget {
  @override
  _EventAndNotificationPageState createState() =>
      _EventAndNotificationPageState();
}

class _EventAndNotificationPageState extends State<EventAndNotificationPage> {
  PointerEvent _event;
  String _operation = "No Gesture detected!"; //保存事件名
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件处理与通知'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
                'Flutter中的手势系统有两个独立的层。第一层为原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸、鼠标和触控笔）的位置和移动。 第二层为手势，描述由一个或多个指针移动组成的语义动作，如拖动、缩放、双击等。'),
            Text(
              '原始指针（Point）事件处理',
              style: TextStyle(fontSize: 32.0),
            ),
            Listener(
              onPointerDown: (PointerDownEvent event) {
                setState(() {
                  _event = event;
                });
              },
              onPointerMove: (PointerMoveEvent event) {
                setState(() {
                  _event = event;
                });
              },
              onPointerUp: (PointerUpEvent event) {
                setState(() {
                  _event = event;
                });
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 150.0,
                child: Text(
                  _event?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              //behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A"),
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Center(
                        child: Text("down0"),
                      ),
                    ),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text("down1"),
                      ),
                    ),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent, //
                )
              ],
            ),
            Text('忽略PointerEvent, IgnorePointer 和 AbsorbPointer'),
            Text('AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与'),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    width: 200.0,
                    height: 100.0,
                    color: Colors.green,
                  ),
                  onPointerDown: (PointerDownEvent event) {
                    print('in');
                  },
                ),
              ),
              onPointerDown: (PointerDownEvent event) {
                print('up');
              },
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
            _Drag(),
            Center(
              child: GestureDetector(
                onScaleUpdate: (ScaleUpdateDetails details) {
                  setState(() {
                    _width = 200 * details.scale.clamp(0.8, 10.0);
                  });
                },
                child: Image.asset(
                  'assets/images/20170118163218_28szy.jpeg',
                  width: _width,
                ),
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "你好世界"),
                    TextSpan(
                      text: "点我变色",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: _toggle ? Colors.blue : Colors.red),
                      recognizer: _tapGestureRecognizer
                        ..onTap = () {
                          setState(() {
                            _toggle = !_toggle;
                          });
                        },
                    ),
                    TextSpan(text: "你好世界"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  __DragState createState() => __DragState();
}

class __DragState extends State<_Drag> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              onPanDown: (DragDownDetails details) {
                print('用户手指按下：${details.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                  _left += details.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails details) {
                //打印滑动结束时在x、y轴上的速度
                print(details.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
