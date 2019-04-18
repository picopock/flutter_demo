import 'package:flutter/material.dart';

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('布局'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  '线性布局 Row、Col',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello world!'),
                  Text(' I am Jack '),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello world!'),
                  Text(' I am Jack '),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection:
                    TextDirection.rtl, // 水平方向上子widget的布局顺序，从左往右还是从右往左
                children: <Widget>[
                  Text('Hello world!'),
                  Text(' I am Jack '),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection
                    .up, // 纵轴的对齐方向，默认 VerticalDirection.down.即从上到下
                children: <Widget>[
                  Text(
                    'Hello world!',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(' I am Jack '),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    height: 600.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            color: Colors.red,
                            child: Column(
                              mainAxisSize: MainAxisSize.max, // 无效
                              children: <Widget>[
                                Text("hello world "),
                                Text("I am Jack "),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 600.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("hello world "),
                                  Text("I am Jack "),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '弹性布局 Flex 和 Expanded, Spacer',
                style: TextStyle(fontSize: 32.0),
              ),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 100.0,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(
                        //Spacer的功能是占用指定比例的空间，实际上它只是Expanded的一个包装
                        ///    new Expanded(
                        ///      flex: flex,
                        ///      child: const SizedBox(
                        ///        height: 0.0,
                        ///        width: 0.0,
                        ///      ),
                        ///    );
                        flex: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                '流式布局 Wrap 和 Flow',
                style: TextStyle(fontSize: 32.0),
              ),
              Text('新组件 Chip、CircleAvatar'),
              Wrap(
                direction: Axis.horizontal,
                spacing: 12.0, // 主轴方向子 widget 间距
                runSpacing: 12.0, // 纵轴方向间距
                alignment: WrapAlignment.center, // 沿主轴方向居中
                // runAlignment: WrapAlignment.start, //
                children: <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('Hamilton'),
                  ),
                  Chip(
                    label: Text('Lafayette'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('M'),
                    ),
                  ),
                  Chip(
                    label: Text('Mulligan'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('H'),
                    ),
                  ),
                  Chip(
                    label: Text('Laurens'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('J'),
                    ),
                  )
                ],
              ),
              Flow(
                delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
                children: <Widget>[
                  Container(width: 80.0, height: 80.0, color: Colors.red),
                  Container(width: 80.0, height: 80.0, color: Colors.green),
                  Container(width: 80.0, height: 80.0, color: Colors.blue),
                  Container(width: 80.0, height: 80.0, color: Colors.yellow),
                  Container(width: 80.0, height: 80.0, color: Colors.brown),
                  Container(width: 80.0, height: 80.0, color: Colors.purple),
                ],
              )
            ],
          ),
        ));
  }
}
