import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './app/app.dart';
import './store/app.dart' show appReducer, AppState;
import './store/count.dart' show CountState;
import './store/user.dart' show UserInfo;

void main() {
  runApp(new FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState(
      count: CountState(count: 0),
      userInfo: UserInfo(
        name: '',
        age: 0,
      ),
      locale: Locale('zh', 'CN'),
    ),
  );

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return new StoreProvider<AppState>(
      store: store,
      child: App(),
    );
  }
}
