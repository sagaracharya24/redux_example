import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/redux/actions/cuonter_actions.dart';
import 'package:redux_example/redux/stores/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('You have pushed the button this many times'),
            StoreConnector<CounterState, int>(
                converter: (store) => store.state.count,
                builder: (context, count) {
                  return Text('$count');
                }),
          ],
        ),
      ),
      floatingActionButton:
          StoreConnector<CounterState, VoidCallback>(converter: (store) {
        return () => store.dispatch(IncreamentAction(2));
      }, builder: (context, increament) {
        return FloatingActionButton(
          onPressed: increament,
          tooltip: 'Increamnet',
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
