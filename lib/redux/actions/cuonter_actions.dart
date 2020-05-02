
import 'package:redux_example/redux/stores/counter_state.dart';

class IncreamentAction {
  int amount;
  IncreamentAction(this.amount);
  CounterState increment(CounterState prevState, int amount) {
    prevState.count += amount;
    return prevState;
  }
}
