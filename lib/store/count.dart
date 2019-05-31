import 'dart:math';

enum Actions { Increment, Decrement }

class CountState {
  num count = 0;

  CountState({this.count});
}

CountState initialState = CountState(count: 0);

CountState countReducer(CountState state, dynamic action) {
  switch (action) {
    case Actions.Increment:
      state.count = state.count + 1;
      return state;
    case Actions.Decrement:
      state.count = max(0, state.count - 1);
      return state;
    default:
      return state;
  }
}
