import 'dart:math';

import 'package:catinboxanimaltion/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> flapAnimation;
  AnimationController flapController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    catAnimation = Tween(
      begin: -80.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    flapController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    flapAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 2,
    ).animate(
      CurvedAnimation(
        parent: flapController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: GestureDetector(
        onTap: () {
          if (catController.isCompleted) {
            catController.reverse();
            flapController.reverse();
          } else {
            catController.forward();
            flapController.forward();
          }
        },
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              AnimatedBuilder(
                animation: catAnimation,
                // ignore: missing_return
                builder: (context, child) {
                  return Positioned(
                    child: Cat(),
                    top: catAnimation.value,
                    right: 0.0,
                    left: 0.0,
                  );
                },
              ),
              Container(
                color: Colors.brown,
                height: 200,
                width: 200,
              ),
              leftFlap(),
              rightFlap()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return Cat();
  }

  Widget leftFlap() {
    return Positioned(
      left: 2,
      child: AnimatedBuilder(
          animation: flapAnimation,
          builder: (context, child) {
            return Transform.rotate(
              child: Container(
                height: 10.0,
                width: 125.0,
                color: Colors.brown,
              ),
              angle: flapAnimation.value,
              alignment: Alignment.topLeft,
            );
          }),
    );
  }

  Widget rightFlap() {
    return Positioned(
      right: 2,
      child: AnimatedBuilder(
          animation: flapAnimation,
          builder: (context, child) {
            return Transform.rotate(
              child: Container(
                height: 10.0,
                width: 125.0,
                color: Colors.brown,
              ),
              angle: -flapAnimation.value,
              alignment: Alignment.topRight,
            );
          }),
    );
  }
}
