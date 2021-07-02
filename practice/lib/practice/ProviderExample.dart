import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterChangeNotifier>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('目前記數值: ${counter.count}'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BPage()));
              },
              child: Text('跳至B頁'),
            )
          ],
        ),
      ),
    );
  }
}

class CounterChangeNotifier with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  increment() {
    _count++;
    notifyListeners();
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CounterChangeNotifier>(
          builder: (context, counter, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('目前記數值'), Text('${counter.count}')],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 使用 Provider.of，並且將 listen 設定為 false(若沒設定，預設為 true)，
          // 則不會再次調用 Widget 重新構建（ build ）畫面 ，更省效能。
          Provider.of<CounterChangeNotifier>(context, listen: false)
              .increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
