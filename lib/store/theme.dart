import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

// action
class ChangeThemeDataAction {
  final ThemeData themeData;

  ChangeThemeDataAction({
    @required this.themeData,
  });

  @override
  String toString() {
    return 'ChangeUserInfoAction{themeData: $themeData}';
  }
}

// reducer
final themeReducer = combineReducers<ThemeData>(
    [TypedReducer<ThemeData, ChangeThemeDataAction>(_changeThemeData)]);

ThemeData _changeThemeData(ThemeData themeData, ChangeThemeDataAction action) {
  themeData = action.themeData;
  return themeData;
}
