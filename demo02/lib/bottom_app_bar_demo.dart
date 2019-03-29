import 'package:flutter/material.dart';
import './each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView = List();
  int _index = 0;

  @override
  initState() {
    super.initState();
    _eachView = _eachView
      ..add(EachView('Home'))
      ..add(EachView('JSPang'))
      ..add(EachView('Rectangle'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return EachView('New Page');
            },
          ));
        },
        tooltip: 'Add something',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue[600],
          shape: CircularNotchedRectangle(),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.add_alert),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
              ),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
          )),
    );
  }
}
