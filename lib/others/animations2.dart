import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ANimations extends StatefulWidget {
  const ANimations({Key? key}) : super(key: key);

  @override
  _ANimationsState createState() => _ANimationsState();
}

class _ANimationsState extends State<ANimations> with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation3;
  late Animation<Color?> animation2;
  late Animation<double> animation4;
  late Animation<double> animation5;
  AnimationController? animationController;


  ////////////////////////////////////////////////
  late AnimationController _animationController;
  late Animation _animation;

  void mylistener(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(mylistener);
      _animationController.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ));
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds:1));
    animation = Tween<double>(begin: 50, end: 80).animate(animationController!);
    animation3 = Tween<double>(begin: 270, end: 90).animate(animationController!);
    animation4 = Tween<double>(begin: 0, end: 50).animate(animationController!);
    animation5=Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(parent:animationController! , curve:Curves.bounceInOut ));
    animation2 = ColorTween(begin: Colors.red, end: Colors.white)
        .animate(animationController!);
    animationController!.forward();


    animation4.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animationController!.reverse();
      }
      // // }else if(status==AnimationStatus.dismissed){
      // //   animationController!.forward();
      // }
    });
    animation.addListener(() {
      setState(() {
        animation.value;
      });
    });



    //////////////////////////////////////////////
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener(mylistener);

    _animationController.forward();



  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100, left: 50, right: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              ),
              SizedBox(
                height: 20,
              ),
              Transform.scale(
              scale: animation4.value,
                child: Container(
                  height: 100,
                  width: 100,
                 color: Colors.yellow,
                 // color: animation2.value,
                  child: FlutterLogo(),
                ),
              ),Transform.scale(
                scale: animation5.value,
                child: Container(
                  height: 100,
                  width: 100,
                 color: Colors.red,
                 // color: animation2.value,
                  child: FlutterLogo(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Transform.rotate(
                angle: animation3.value,
                child: Container(
                  height: 100,
                  width: 100,
                //  color: animation2.value,
                  child: FlutterLogo(),
                ),
              ),
              Container(
                child: AnimatedLogo(
                  animation: animation3,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //////////////////////////////////////////////////
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Transform(
                  transform:
                  Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  final Tween<double> size = Tween<double>(begin: 50, end: 100);

  AnimatedLogo({Key? key, required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container();
  /*  final Animation<double> animation =listenable ;
    return Opacity(
      opacity: animation.value,
      child: Container(
        height:size.evaluate(animation),
        width:200,
        child: FlutterLogo(),
      ),
    );*/
  }
}
