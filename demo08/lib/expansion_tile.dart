import 'package:flutter/material.dart';

// class ExpansionTileDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('expansion tile'),
//       ),
//       body: Center(
//         child: ExpansionTile(
//           title: Text('Expansion Tile'),
//           leading: Icon(Icons.ac_unit),
//           backgroundColor: Colors.white12,
//           children: <Widget>[
//             ListTile(
//               title: Text('list tile'),
//               subtitle: Text('subtitle'),
//             ),
//           ],
//           initiallyExpanded: false,
//         ),
//       ),
//     );
//   }
// }

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  var currentPanelIndex = -1;
  List<int> mList; // 组成一个int 类型数组，用来控制索引
  List<ExpandStateBean>
      expandStateList; // 展开的状态列表， ExpandStateBean 是自定义的类构造方法，调用这个类的时候自动执行

  _ExpansionPanelListDemoState() {
    mList = List();
    expandStateList = List();
    // 遍历为两个list 赋值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }
  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, bool isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          //交互回掉属性，里边是个匿名函数
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            //进行map操作，然后用toList再次组成List
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No. $index'),
                );
              },
              body: ListTile(
                title: Text('expansion No. $index'),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
