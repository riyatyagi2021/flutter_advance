import 'dart:math';

import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({Key? key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  double width = 200;
  double height = 300;
  Color color = Colors.orange;
  BorderRadiusGeometry border = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: height,
          width: width,
         decoration: BoxDecoration(
           color: color,
           borderRadius: border
         ),
          curve: Curves.fastOutSlowIn,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var random=Random();
            width=random.nextInt(300).toDouble();
            height=random.nextInt(300).toDouble();

            color=Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                1);

          border=
                BorderRadius.circular(random.nextInt(100).toDouble());
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
