import 'dart:async';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;
  // 輸入事件

  Stream<int> get counter => _counterStateController.stream;
  // 輸出事件

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is DecrementEvent) {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}