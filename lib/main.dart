import 'package:flutter/material.dart';

import './demos/demo1/bottom_navigation.dart';
import './demos/demo2/bottom_app_bar_demo.dart';
import './demos/demo3/pages.dart';
import './demos/demo4/frosted_glass.dart';
import './demos/demo5/main.dart';
import './demos/demo6/search_bar.dart';
import './demos/demo7/wrap_demo.dart';
import './demos/demo8/expansion_tile.dart';
import './demos/demo9/main.dart';
import './demos/demo10/splash_screen.dart';
import './demos/demo11/right_back_demo.dart';
import './demos/demo12/tool_tips_demo.dart';
import './demos/demo13/draggable_demo.dart';
import './demos/demo14/main.dart';
import './demos/demo15/grid_list.dart';
import './demos/demo16/dismissible_page.dart';
import './demos/demo17/animated_list.dart';
import './demos/demo18/read_write.dart';
import './demos/demo19/network_request.dart';
import './demos/demo20/platform_channel.dart';
import './demos/demo21/demo21.dart';
import './demos/demo22/demo22.dart';
import './demos/demo23/demo23.dart';
import './demos/demo24/text_field_and_form.dart';
import './demos/demo25/layout_page.dart';
import './demos/demo26/container_page.dart';

void main() => runApp(MyApp());

class ListItem extends StatelessWidget {
  final num value;
  final String title;

  ListItem({this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'demo$value');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Text(title),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> demos = [];

  @override
  void initState() {
    super.initState();

    demos.addAll([
      ListItem(value: 1, title: '底部导航栏'),
      ListItem(value: 2, title: '带凹槽的底部导航栏'),
      ListItem(value: 3, title: '渐隐渐现的路由动画效果'),
      ListItem(value: 4, title: '毛玻璃效果'),
      ListItem(value: 5, title: '保留页面状态'),
      ListItem(value: 6, title: '搜索条'),
      ListItem(value: 7, title: 'Wrap 流式布局'),
      ListItem(value: 8, title: '展开闭合案例'),
      ListItem(value: 9, title: '贝塞尔曲线切割'),
      ListItem(value: 10, title: '打开应用的闪屏动画'),
      ListItem(value: 11, title: '右滑返回上一页'),
      ListItem(value: 12, title: 'Tooltip'),
      ListItem(value: 13, title: '拖拽'),
      ListItem(value: 14, title: '圆形头像和圆角效果'),
      ListItem(value: 15, title: 'Grid List'),
      ListItem(value: 16, title: '滑动关闭'),
      ListItem(value: 17, title: 'AnimatedList: 添加或删除，并伴有动画效果'),
      ListItem(value: 18, title: '读写文件: dart:io path_provider'),
      ListItem(value: 19, title: '网络请求: dio'),
      ListItem(value: 20, title: 'platform channel'),
      ListItem(value: 21, title: '文本、字体样式，按钮'),
      ListItem(value: 22, title: '图片和 Icon '),
      ListItem(value: 23, title: '单选开关和复选框'),
      ListItem(value: 24, title: '输入框和表单'),
      ListItem(value: 25, title: '布局'),
      ListItem(value: 26, title: '容器类 Widgets'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo collection',
      routes: {
        'demo1': (BuildContext context) => BottomNavigation(),
        'demo2': (BuildContext context) => BottomAppBarDemo(),
        'demo3': (BuildContext context) => FirstPage(),
        'demo4': (BuildContext context) => FrostedGlass(),
        'demo5': (BuildContext context) => KeepAlivePage(),
        'demo6': (BuildContext context) => SearchBar(),
        'demo7': (BuildContext context) => WrapDemo(),
        'demo8': (BuildContext context) => ExpansionPanelListDemo(),
        'demo9': (BuildContext context) => MyHomePage(),
        'demo10': (BuildContext context) => SplashScreen(),
        'demo11': (BuildContext context) => RightBackDemo(),
        'demo12': (BuildContext context) => ToolTipDemo(),
        'demo13': (BuildContext context) => DraggableDemo(),
        'demo14': (BuildContext context) => CircleDemo(),
        'demo15': (BuildContext context) => GridList(),
        'demo16': (BuildContext context) => DismissiblePage(),
        'demo17': (BuildContext context) => AnimatedListSample(),
        'demo18': (BuildContext context) => ReadAndWriteFile(),
        'demo19': (BuildContext context) => HTTPRequest(),
        'demo20': (BuildContext context) => PlatformChannelPage(),
        'demo21': (BuildContext context) => Demo21(),
        'demo22': (BuildContext context) => Demo22(),
        'demo23': (BuildContext context) => SwitchAndCheckBox(),
        'demo24': (BuildContext context) => TextFieldAndForm(),
        'demo25': (BuildContext context) => LayoutPage(),
        "demo26": (BuildContext context) => ContainerPage(),
      },
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter demo collection')),
        body: ListView(
          children: demos,
        ),
      ),
    );
  }
}
