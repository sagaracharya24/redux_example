import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/pages/cat_facts_page.dart';
import 'package:redux_example/redux/actions/cat_facts_action.dart';
import 'package:redux_example/redux/reducers/cat_facts_reducer.dart';
import 'package:redux_example/redux/stores/cats_facts_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = Store<CatsFactState>(catFactsReducer,
      initialState: CatsFactState(), middleware: [thunkMiddleware]);
  store.dispatch(FetchCatFacstsAction().fetchCats());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store store;

  const MyApp({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CatsFactState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CatFactsPage(),
      ),
    );
  }
}
