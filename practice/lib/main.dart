import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/practice/GlobalKeyPractice.dart';
import 'package:practice/practice/ParentWidgetManagesState.dart';
import 'package:practice/practice/ProviderExample.dart';
import 'package:practice/practice/Test.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

//for Redux
enum Actions {
  Increase,
}

int mainReducer(int state, dynamic action) {
  if (Actions.Increase == action) {
    return state + 1; //用state++會無反應
  }
  return state;
}

void main() {
  Store<int> store = Store<int>(mainReducer, initialState: 0);
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // for Redux
  final Store<int> store;

  MyApp({this.store});

  @override //for Redux
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: StoreConnector(
          builder: (BuildContext context, int counter) {
            return ReduxHomePage(counter: counter);
          },
          converter: (Store<int> store) {
            //store的狀態轉變成widget需要的狀態
            return store.state;
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

// // for Provider
// @override
// Widget build(BuildContext context) {
//   return MultiProvider( //for Provider
//     providers: [ChangeNotifierProvider.value(value: CounterChangeNotifier())],
//     //在 widget 元件樹中的最上層，使用 provider ，方便傳遞到其他底層頁面
//     //建議採用 MultiProvider，因為一個 APP 很少一個 provider 就夠用，所以直接上 MultiProvider 。
//     child: MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

}

class ReduxHomePage extends StatelessWidget {
  ReduxHomePage({Key key, this.counter}) : super(key: key);

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> practice = [
    GlobalKeyPractice(),
    ParentWidgetManagesState(),
    Test2(),
    ProviderExample()
  ];
  List<String> practiceTitle = [
    'GlobalKeyPractice',
    'ParentWidgetManagesState',
    'Test',
    'ProviderExample'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: practice.length,
            itemBuilder: (context, index) {
              return RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => practice[index]));
                },
                child: Text(practiceTitle[index]),
              );
            }));
  }
}
