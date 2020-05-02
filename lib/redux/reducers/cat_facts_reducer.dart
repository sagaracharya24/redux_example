import 'package:redux_example/redux/actions/cat_facts_action.dart';
import 'package:redux_example/redux/stores/cats_facts_state.dart';

CatsFactState catFactsReducer(CatsFactState prevState, dynamic action) {
  if (action == FetchCatFactsLoadingAction) {
    prevState.state = LoadingState.loading;
  }
  if (action == FetchCatFactsFailedAction) {
    prevState.state = LoadingState.error;
    return prevState;
  }
  if (action is FetchCatFactsSucessAction) {
    prevState.state = LoadingState.none;
    prevState.catFacts =action.catFacts;
    return prevState;
  }

  if (action == IncreamentFactsReadAction) {
    prevState.factsReadCount++;
    return prevState;
  }

  return prevState;
}
