import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../store/count.dart' show Actions;
import '../../store/name.dart' show ChangeNameAction;
import '../../store/app.dart' show AppState;

typedef OnNameChangeCallback = Function(String name);

class ReduxDemoPage extends StatefulWidget {
  @override
  _ReduxDemoPageState createState() => _ReduxDemoPageState();
}

class _ReduxDemoPageState extends State<ReduxDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Use'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            new StoreConnector<AppState, String>(
              converter: (store) => store.state.count.count.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(Actions.Increment);
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      onPressed: callback,
                      child: Text(
                        'Increment',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(Actions.Decrement);
                  },
                  builder: (context, callback) {
                    return RaisedButton(
                      onPressed: callback,
                      child: Text('Decrement'),
                    );
                  },
                )
              ],
            ),
            Text('UserName:'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: StoreConnector<AppState, OnNameChangeCallback>(
                converter: (store) {
                  return (String userName) {
                    store.dispatch(ChangeNameAction(name: userName));
                  };
                },
                builder: (context, OnNameChangeCallback changeName) {
                  return TextField(
                    onChanged: changeName,
                  );
                },
              ),
            ),
            StoreConnector<AppState, String>(
              converter: (store) {
                return store.state.name.toString();
              },
              builder: (context, String userName) {
                return Text(
                  'Hello $userName',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(Actions.Increment);
        },
        tooltip: 'increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
