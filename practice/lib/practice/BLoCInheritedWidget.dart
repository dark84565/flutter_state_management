import 'package:flutter/material.dart';
import 'CounterBLoC.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc cartBloc;

  CounterProvider({Key key, CounterBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CounterBloc(),
        //若cartBloc為null，則賦予CounterBloc()，否則賦予cartBloc
        super(key: key, child: child);

  static CounterBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterProvider>()
        .cartBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class BLoCInheritedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      child: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = CounterProvider.of(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: _bloc.counter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('${snapshot.data}');
            }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    CounterProvider.of(context).dispose();
  }
}
