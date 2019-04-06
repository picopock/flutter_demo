import 'package:flutter/material.dart';

class DismissiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(20, (int index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: Text('滑动关闭')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            child: ListTile(
              title: Text(item),
            ),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) {
              items.removeAt(index);
              // 底部上滑出一个小部件
              Scaffold.of(context).showSnackBar(SnackBar(
                content: new Text("$item dismissed"),
                backgroundColor: Colors.blue,
                duration: Duration(milliseconds: 500),
              ));
            },
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
