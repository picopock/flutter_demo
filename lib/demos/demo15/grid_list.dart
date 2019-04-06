import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid list'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        scrollDirection: Axis.horizontal,
        children: List.generate(200, (int index) {
          return Center(
            child: Text('Item ${index + 1}',
                style: Theme.of(context).textTheme.headline),
          );
        }),
      ),
    );
  }
}
