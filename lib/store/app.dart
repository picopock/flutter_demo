import './count.dart' show countReducer, CountState;
import './name.dart' show nameReducer;

class AppState {
  CountState count;
  String name;

  AppState({this.count, this.name});
}

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    count: countReducer(state.count, action),
    name: nameReducer(state.name, action),
  );
}
