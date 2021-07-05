import 'package:flutter/material.dart';

class SizeAnimationPage extends StatefulWidget {
  @override
  _SizeAnimationPageState createState() => _SizeAnimationPageState();
}

class _SizeAnimationPageState extends State<SizeAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    _setAnimation();
    super.initState();
  }

  _setAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween(begin: 50.0, end: 150.0).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Image.asset('asset/pic.jpg'),
          builder: (context, child) => Container(
            width: animation.value,
            height: animation.value * 4 / 3,
            child: child,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationController.status == AnimationStatus.reverse ||
              animationController.value == 0) {
            animationController.forward();
          } else {
            animationController.reverse();
          }
        },
        child: Icon(Icons.not_started_outlined),
      ),
    );
  }
}
