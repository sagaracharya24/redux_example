import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/models/cat_fact.dart';
import 'package:redux_example/redux/stores/cats_facts_state.dart';

class CatFactPage extends StatelessWidget {
  final CatFact catFact;

  const CatFactPage({Key key, this.catFact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catFact.userName),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Total amount of posts read:'),
              StoreConnector<CatsFactState, String>(
                converter: (store) => store.state.factRead,
                builder: (context, factsRead) {
                  return Text(factsRead);
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Tottal Amount of Posts'),
              StoreConnector<CatsFactState, int>(
                converter: (store) => store.state.facts,
                builder: (context, facts) {
                  return Text(facts.toString());
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
