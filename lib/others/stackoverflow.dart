import 'package:flutter/material.dart';

class Ani extends StatefulWidget {
  const Ani({Key? key}) : super(key: key);

  @override
  _AniState createState() => _AniState();
}

class _AniState extends State<Ani> with TickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );


    animation = Tween<Offset>(begin: Offset.zero, end: Offset(0, 1.5)) //negative to go upwards
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: animation,
              child: Transform.scale(
                scale: 0.3,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RaisedButton(
              child: Text('Animate'),
              onPressed: () {        //the button that trigger the animation
                if (animation.status == AnimationStatus.completed) {
                  animationController.reverse();
                } else if (animation.status == AnimationStatus.dismissed) {
                  animationController.forward();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
