import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions {
  Increase,
}

int mainReducer(int state, dynamic action) {
  if (Actions.Increase == action) {
    return state + 1; //用state++會無反應
  }
  return state;
}

class ReduxExample extends StatelessWidget {
  ReduxExample({Key key, this.counter}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            Text('$counter'),
          ],
        ),
      ),
      floatingActionButton: StoreConnector<int, VoidCallback>(
        // <store儲存類型,convert返回值的類型>
        builder: (BuildContext context, VoidCallback callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
        converter: (Store<int> store) {
          return () => store.dispatch(Actions.Increase);
        },
      ),
    );
  }
}
