import 'package:catinboxanimaltion/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();

    catController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    catAnimation = Tween(begin: -80.0, end: -35.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
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
          } else {
            catController.forward();
          }
        },
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                color: Colors.brown,
                height: 200,
                width: 200,
              ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return Cat();
  }
}
