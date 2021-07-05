import 'package:flutter/material.dart';
import 'package:practice/Animation/DraggableAnimationPage.dart';
import 'package:practice/Animation/SizeAnimationPage.dart';
import 'package:practice/Animation/TransitionPage.dart';

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  String title;
  Widget currentWidget;

  @override
  void initState(){
    currentWidget = SizeAnimationPage();
    title = 'Size Animation';
    super.initState();
  }

  listTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            currentWidget = SizeAnimationPage();
            title = 'SizeAnimationPage';
          }
          break;
        case 1:
          {
            currentWidget = DraggableAnimationPage();
            title = 'DraggableAnimationPage';
          }
          break;
        case 2:
          {
            currentWidget = TransitionPage();
            title = 'TransitionPage';
          }
          break;

        default:
          break;
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: currentWidget,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: null),
            ListTile(
              title: Text('Size Animation'),
              onTap: () {
                listTapHandler(0);
              },
            ),
            ListTile(
              title: Text('Draggable Cart'),
              onTap: () {
                listTapHandler(1);
              },),
            ListTile(
              title: Text('Page Transition'),
              onTap: () {
                listTapHandler(2);
              },),
          ],
        ),
      ),
    );
  }
}
