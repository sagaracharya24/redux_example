import 'package:redux_example/models/cat_fact.dart';

enum LoadingState { none, loading, error }

class CatsFactState {
  List<CatFact> catFacts = [];
  int get facts => catFacts.length;

  LoadingState state = LoadingState.loading;

  int factsReadCount = 0;

  String get factRead => factsReadCount.toString();
}
