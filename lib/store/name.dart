import 'package:redux/redux.dart';

class ChangeNameAction {
  final String name;

  ChangeNameAction({this.name});

  @override
  String toString() {
    return 'ChangeNameAction{name: $name}';
  }
}

final nameReducer = combineReducers<String>(
    [TypedReducer<String, ChangeNameAction>(_changeName)]);

String _changeName(String name, ChangeNameAction action) {
  return action.name;
}
