import 'package:flutter/material.dart';

class ParentWidgetManagesState extends StatefulWidget {
  @override
  _ParentWidgetManagesStateState createState() =>
      _ParentWidgetManagesStateState();
}

class _ParentWidgetManagesStateState extends State<ParentWidgetManagesState> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TapBoxB(
          active: _active,
          onChanged: _handleTapBoxChanged,
        ),
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  //typedef ValueChanged<T> = void Function(T value);

  TapBoxB({Key key, this.active: false, this.onChanged}) : super(key: key);

  void _handleTap() {  //執行call back
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
