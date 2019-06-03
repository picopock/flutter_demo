import 'package:flutter/material.dart';

import './count.dart' show countReducer, CountState;
import './user.dart' show UserInfo, userReducer;
import './locale.dart' show localeReducer;
import './theme.dart' show themeReducer;

class AppState {
  CountState count;
  UserInfo userInfo;
  ThemeData themeData;
  Locale locale;

  AppState({this.count, this.userInfo, this.themeData, this.locale});
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    count: countReducer(state.count, action),
    userInfo: userReducer(state.userInfo, action),
    themeData: themeReducer(state.themeData, action),
    locale: localeReducer(state.locale, action),
  );
}
