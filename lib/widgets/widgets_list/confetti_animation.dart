import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimationn extends StatefulWidget {
  const ConfettiAnimationn({Key? key}) : super(key: key);

  @override
  _ConfettiAnimationnState createState() => _ConfettiAnimationnState();
}

class _ConfettiAnimationnState extends State<ConfettiAnimationn> {
  late ConfettiController controller;
  @override
  void initState() {
    super.initState();
    invokeConfetti();
    //controller.play();
  }

  void invokeConfetti() {
    controller = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          buildConfettiWidget(controller, pi), //  pi/1
          buildConfettiWidget(controller, pi), //  pi/4
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/trophy.jpeg',
              height: 300,
              width: 200,
            ),
          ),
          buildButton()
        ]),
      ),
    );
  }

  buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              controller.play();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.red, padding: EdgeInsets.all(20)),
            child: Text("Badhaai Hooo")),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 10, // set a lower max blast force
        minBlastForce: 8, // set a lower min blast force
        emissionFrequency: 0.4,
        numberOfParticles: 5, // a lot of particles at once
        gravity: 0.3,
      ),
    );
  }
}
