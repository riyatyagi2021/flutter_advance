import 'dart:math';

import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with TickerProviderStateMixin {

  //animated container
  double width = 200;
  double height = 300;
  Color color = Colors.orange;
  BorderRadiusGeometry border = BorderRadius.circular(10);

  //hide and fade
  bool isVisible = true;


  //animated builder
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
        vsync: this
    )..repeat();
  }


  //animated align
  bool selected=false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.yellow[200],
          padding: EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(color: color, borderRadius: border),
                  curve: Curves.fastOutSlowIn,
                ),
                SizedBox(
                  height: 50,
                ),
                AnimatedOpacity(
                  opacity: isVisible ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isVisible=!isVisible;
                      });
                    },
                    child: Text("Fade Feature"),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                AnimatedBuilder(
                    animation: controller!,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.greenAccent,
                    ),
                    builder: (BuildContext context, Widget?child){
                    return Transform.rotate(
                      angle: controller!.value * 2 * pi,
                      child: child,
                        );
                }),

                SizedBox(
                  height: 50,
                ),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=!selected;
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                    margin: EdgeInsets.only(bottom: 60),
                    child: AnimatedAlign(
                        alignment: selected? Alignment.centerLeft: Alignment.centerRight,
                        duration: Duration(milliseconds: 500),
                      child: FlutterLogo(textColor: Colors.purple,size: 50,),
                      curve: Curves.slowMiddle,
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var random = Random();
            width = random.nextInt(300).toDouble();
            height = random.nextInt(300).toDouble();

            color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);

            border = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.animation),
        ),
      ),
    );
  }
}
