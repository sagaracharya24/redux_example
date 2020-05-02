import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/models/cat_fact.dart';
import 'package:redux_example/pages/cat_fact_page.dart';
import 'package:redux_example/redux/actions/cat_facts_action.dart';
import 'package:redux_example/redux/stores/cats_facts_state.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts App'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: StoreConnector<CatsFactState, String>(
              converter: (store) => store.state.factRead,
              builder: (context, factsRead) {
                return Text('post read : $factsRead');
              },
            ),
          )
        ],
      ),
      body: StoreConnector<CatsFactState, CatsFactState>(
        converter: (store) => store.state,
        builder: (context, catFactState) {
          if (catFactState.state == LoadingState.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (catFactState.state == LoadingState.none) {
            print(catFactState.catFacts.length);

            return ListView.builder(
              itemCount: catFactState.catFacts.length,
              itemBuilder: (context, i) {
                final catFact = catFactState.catFacts[i];
                return CatFactsTile(catFact: catFact);
              },
            );
          } else
            return Center(
              child: Text('There was and error'),
            );
        },
      ),
      floatingActionButton:
          StoreConnector<CatsFactState, VoidCallback>(converter: (store) {
        return () => store.dispatch(FetchCatFacstsAction().fetchCats());
      }, builder: (context, fetchFacts) {
        return FloatingActionButton(
          onPressed: fetchFacts,
          child: Icon(Icons.add),
        );
      }),
    );
  }
}

class CatFactsTile extends StatelessWidget {
  final CatFact catFact;

  const CatFactsTile({Key key, this.catFact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CatsFactState, VoidCallback>(converter: (store) {
      return () {
        store.dispatch(IncreamentFactsReadAction);
      };
    }, builder: (context, increamentFactsRead) {
      return ListTile(
        onTap: () {
          increamentFactsRead();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CatFactPage(
                    catFact: catFact,
                  )));
        },
        title: Text(catFact.userName),
        subtitle: Text(catFact.text),
      );
    });
  }
}
