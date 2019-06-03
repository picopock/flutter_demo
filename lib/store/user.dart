import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

enum ChangeUserInfoActionTypes { Name, Age }

// action
class ChangeUserInfoAction {
  final ChangeUserInfoActionTypes type;
  final data;

  ChangeUserInfoAction({
    @required this.type,
    @required this.data,
  });

  @override
  String toString() {
    return 'ChangeUserInfoAction{type: $type, data: $data}';
  }
}

// reducer

class UserInfo {
  String name;
  num age;

  UserInfo({this.name, this.age});
}

final userReducer = combineReducers<UserInfo>(
    [TypedReducer<UserInfo, ChangeUserInfoAction>(_changeUserInfo)]);

UserInfo _changeUserInfo(UserInfo userInfo, ChangeUserInfoAction action) {
  switch (action.type) {
    case ChangeUserInfoActionTypes.Name:
      userInfo.name = action.data;
      return userInfo;
    case ChangeUserInfoActionTypes.Age:
      userInfo.age = action.data;
      return userInfo;
    default:
      return userInfo;
  }
}
