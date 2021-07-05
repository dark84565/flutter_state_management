import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class CounterModel {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  //initial 0, 暫存

  get stream$ => _counter.stream;

  int get current => _counter.value;

  increment() {
    _counter.add(current + 1);
  }

  decrement() {
    _counter.add(current - 1);
  }
}

class BLoCRxDart extends StatelessWidget {
  final counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: counterModel.stream$,
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                })
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              counterModel.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              counterModel.decrement();
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
