import 'dart:convert';

import 'package:redux_example/models/cat_fact.dart';
import 'package:redux_example/redux/stores/cats_facts_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;

class FetchCatFacstsAction {
  ThunkAction<CatsFactState> fetchCats() {
    const _catFactsUrl = 'https://cat-fact.herokuapp.com/facts';
    return (store) async {
      store.dispatch(FetchCatFactsLoadingAction);
      final response = await http.get(_catFactsUrl);
      print('This is the status code :${response.statusCode}');
      if (response.statusCode == 200) {
        print(response.statusCode);
        Map<String, dynamic> decodedItems = json.decode(response.body);
        final catfacts = List.from(decodedItems['all'])
            .map((json) => CatFact.fromJson(json))
            .toList();
        print(catfacts.length);
        store.dispatch(FetchCatFactsSucessAction(catfacts));
      } else {
        store.dispatch(FetchCatFactsFailedAction);
      }
    };
  }
}

class FetchCatFactsLoadingAction {}

class FetchCatFactsFailedAction {}

class FetchCatFactsSucessAction {
  List<CatFact> catFacts;
  FetchCatFactsSucessAction(this.catFacts);
}

class IncreamentFactsReadAction {}
