import 'package:flutter/material.dart';
import 'dart:math';
import 'cat.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> _catAnimation;
  AnimationController _catController;

  @override
  void initState() {
    super.initState();
    _catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _catAnimation = Tween(begin: -50.0, end: -80.0).animate(
      CurvedAnimation(
        parent: _catController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              buildAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap()
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      child: Cat(),
      animation: _catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          left: 0.0,
          right: 0.0,
          top: _catAnimation.value,
        );
      },
    );
  }

  Widget buildBox() {
    return Container(width: 200.0, height: 200.0, color: Colors.brown);
  }

  Widget buildLeftFlap() {
      return Positioned(
        child: Transform.rotate(
          angle: pi * 0.6,
          alignment: AlignmentDirectional.topStart,
          child: Container(width: 125.0, height: 10.0, color: Colors.brown),
        ),
        left: 10.0,
        top: 5.0,
    );
  }

  Widget buildRightFlap() {
      return Positioned(
        child: Transform.rotate(
          angle: pi * 0.6,
          alignment: AlignmentDirectional.topEnd,
          child: Container(width: 125.0, height: 10.0, color: Colors.brown),
        ),
        right: 10.0,
        top: 5.0,
    );
  }

  onTap() {
    if (_catController.isAnimating) return;

    if (_catController.isCompleted) {
      _catController.reverse();
    } else {
      _catController.forward();
    }
  }
}
