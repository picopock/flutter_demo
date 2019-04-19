import 'package:flutter/material.dart';
import 'dart:math' as math;
import './my_drawer.dart';

class ContainerPage extends StatefulWidget {
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  bool get wantKeeped => true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text('容器类 Widgets'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Scaffold.of(context).openDrawer();
              _globalKey.currentState.openDrawer();
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.business), title: Text('Business')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.school), title: Text('School')),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: tabs.map(
          (e) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(e, textScaleFactor: 5),
                  Text(
                    'Padding',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Hello world'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('I am Jack'),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                          child: Text('Your friend'),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '布局限制类容器：ConstrainedBox 和 SizedBox',
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                      'ConstrainedBox 用于对其子 Widget 添加额外的约束。例如，如果你想让子widget的最小高度是80像素，你可以使用const BoxConstraints(minHeight: 80.0)作为子widget的约束。'),
                  Text(
                      'BoxConstraints还定义了一些便捷的构造函数，用于快速生成特定限制规则的BoxConstraints，如BoxConstraints.tight(Size size)，它可以生成给定大小的限制；const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints'),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 60.0,
                      maxWidth: 300.0,
                      minHeight: 50.0,
                      maxHeight: 80.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 5.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Text('SizedBox: 给子widget 指定宽高'),
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      width: double.infinity,
                      height: 30.0,
                    ),
                  ),
                  Text('SizedBox 只是 ContrainedBox 的一个定制'),
                  Text('UnConstrainedBox'),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 60.0, minHeight: 100.0),
                    child: UnconstrainedBox(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Text('DecoratedBox 和 BoxDecoration'),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange[700]]),
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    position: DecorationPosition.background,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 18.0),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    "Transform",
                    style: TextStyle(fontSize: 32.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.0),
                    color: Colors.black,
                    child: Transform(
                      alignment: Alignment.topRight,
                      transform: Matrix4.skewY(0.3),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text('Apartment for rent!'),
                      ),
                    ),
                  ),
                  Text('平移'),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.translate(
                        offset: Offset(-20.0, -5.0),
                        child: Text('Hello world!'),
                      ),
                    ),
                  ),
                  Text('旋转'),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.rotate(
                        angle: math.pi / 2,
                        child: Text('Hello world!'),
                      ),
                    ),
                  ),
                  Text('缩放'),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Text('Hello world!'),
                      ),
                    ),
                  ),
                  Text('RotatedBox'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        child: RotatedBox(
                          quarterTurns: 1, // 旋转90度（1/4圈）
                          child: Text('Hello world'),
                        ),
                      ),
                      Text(
                        '你好',
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
