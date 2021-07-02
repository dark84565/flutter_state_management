import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 0;

  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ScopedModelExample extends StatelessWidget {
  CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
      model: countModel,
      child: Scaffold(
        body: TopScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> countModel.increment(),
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(builder: (context, child, model) {
      return Center(
        child: Text(model._count.toString()),
      );
    });
  }
}
