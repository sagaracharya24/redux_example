import 'package:redux_example/redux/actions/cuonter_actions.dart';
import 'package:redux_example/redux/stores/counter_state.dart';

CounterState counterStateReducer(CounterState prevState, dynamic action) {
  if (action is IncreamentAction) {
    return action.increment(prevState, action.amount);
  }

  return prevState;
}
