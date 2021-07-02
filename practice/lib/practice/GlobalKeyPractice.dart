import 'package:flutter/material.dart';

class GlobalKeyPractice extends StatefulWidget {
  GlobalKeyPractice({Key key}) : super(key: key);

  @override
  _GlobalKeyPracticeState createState() => _GlobalKeyPracticeState();
}

class _GlobalKeyPracticeState extends State<GlobalKeyPractice> {
  final GlobalKey<_SwitcherWidgetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitcherWidget(key: key),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          key.currentState.changeState();
        },
        child: Text('change'),
      ),
    );
  }
}

class SwitcherWidget extends StatefulWidget {
  SwitcherWidget({Key key}) : super(key: key);

  @override
  _SwitcherWidgetState createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
          value: isActive,
          onChanged: (bool currentStatus) {
            isActive = currentStatus;
            setState(() {});
          }),
    );
  }

  changeState() {
    isActive = !isActive;
    setState(() {});
  }
}
