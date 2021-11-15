import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return shimmerEffect();
        },
      ),
    );
  }

  Widget shimmerEffect() => ListTile(
    leading: ShimmerWidgett.circular(width: 50, height: 50),
        title: Align(
          alignment: Alignment.centerLeft,
            child: ShimmerWidgett.rectangular(height: 16,width: MediaQuery.of(context).size.width*0.3,)),
        subtitle: ShimmerWidgett.rectangular(height: 14),
      );
}















class ShimmerWidgett extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidgett.rectangular(
      {this.width = double.infinity, required this.height}):this.shapeBorder=const RoundedRectangleBorder();

  const ShimmerWidgett.circular(
      {required this.width , required this.height, this.shapeBorder=const CircleBorder()});



  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.green,
      baseColor: Colors.cyan,
      child: Container(
        height: height,
        width: width,

        decoration: ShapeDecoration(
            shape:shapeBorder,
          color: Colors.grey,

        ),
      ),
    );
  }
}
