import 'dart:math';

import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  const Animation3({Key? key}) : super(key: key);

  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> with TickerProviderStateMixin {


  bool reversed = false;
  late Animation<dynamic> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = TweenSequence([TweenSequenceItem(tween: Tween(begin: 0.0, end: -pi / 2), weight: 0.5),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 0.5)
    ]).animate(_animationController);
  }

  _doAnim() {
    //if (!mounted) return;
    if (reversed) {
      _animationController.reverse();
      reversed = false;
    } else {
      _animationController.forward();
      reversed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flip"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: GestureDetector(
              onTap: _doAnim,
              child: IndexedStack(
                children: <Widget>[CardOne(), CardTwo()],
                alignment: Alignment.center,
                index: _animationController.value < 0.5 ? 0 : 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            "Tap to see something",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Container(
        width: 300,
        height: 300,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Text(
              "Have a great future  ${'\u2764'}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


