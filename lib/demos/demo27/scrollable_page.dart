import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScrollablePage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scrollable widget'),
      ),
      //   body: SingleChildScrollViewPage(),
      //   body: ListViewPage(),
      // body: ListViewBuilderPage(),
      //   body: ListViewSeparatedPage(),
      //   body: InfiniteListView(),
      // body: GridViewPage(),
      // body: GridCountView(),
      // body: GridExtentView(),
      // body: InfiniteGridView(),
      // body: CustomScrollViewPage(),
      body: ScrollNotificationPage(),
    );
  }
}

class SingleChildScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: str
                .split('')
                .map((i) => Text(
                      i,
                      textScaleFactor: 8.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 50.0,
      shrinkWrap:
          true, // 是否根据子widget的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView的会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ],
    );
  }
}

class ListViewBuilderPage extends StatefulWidget {
  @override
  _ListViewBuilderPageState createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  initState() {
    super.initState();
    _controller.addListener(() {
      print('offset: ${_controller.offset}');
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset > 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${index + 1}'),
          );
        },
        itemCount: 100,
        itemExtent: 50.0,
        controller: _controller,
      ),
      floatingActionButton: showToTopBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                // _controller.jumpTo(0.0);
                _controller.animateTo(
                  0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            )
          : null,
    );
  }
}

class ListViewSeparatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );

    return ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          title: Text('${index + 1}'),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }
}

// 无限滚动
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##';
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          // 如果到了表尾
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              // 获取数据
              _retrieveData();
              // 加载时显示loading
              return Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return Divider(height: .0);
        },
      ),
    );
  }
}

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   childAspectRatio: 1.0,
      // ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120.0,
        childAspectRatio: 2.0, //宽高比为2
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridCountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
    // 我们通过它可以快速的创建横轴固定数量子元素的GridView
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridExtentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
    // 我们通过它可以快速的创建横轴固定数量子元素的GridView
    return GridView.extent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(seconds: 3)).then((onValue) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 3.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index == _icons.length - 1 && _icons.length < 100) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
      itemCount: _icons.length,
    );
  }
}

class CustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, // 滚动时是否在顶部显示
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollView'),
              background: Image.asset(
                'assets/images/20170118163218_28szy.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item ${index + 1}'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 20,
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item ${index + 1}'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollNotificationPage extends StatefulWidget {
  @override
  _ScrollNotificationPageState createState() => _ScrollNotificationPageState();
}

class _ScrollNotificationPageState extends State<ScrollNotificationPage> {
  String _progress = '0%';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = '${(progress * 100).toInt()}%';
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          // 该回调返回一个布尔值，代表是否阻止该事件继续向上冒泡，如果为true时，则冒泡终止，事件停止向上传播，如果不返回或者返回值为false 时，则冒泡继续
          // return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext ctx, int i) {
                return ListTile(
                  title: Text('${i + 1}'),
                );
              },
              itemCount: 100,
              itemExtent: 50.0,
            ),
            CircleAvatar(
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
