
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;



class CanvasPractice extends StatefulWidget {
  const CanvasPractice({Key? key}) : super(key: key);

  @override
  _CanvasPracticeState createState() => _CanvasPracticeState();
}

class _CanvasPracticeState extends State<CanvasPractice> {
ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage('assets/images/ani.jpeg');
  }

  Future loadImage(String path) async{
    final data=await rootBundle.load(path);
    final bytes=data.buffer.asUint8List();
    final imagee=await decodeImageFromList(bytes);
    setState(() => this.image=imagee);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 300,
                    color:Colors.yellow ,
                    child: CustomPaint(
                      foregroundPainter: LinePaint(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    width: 300,
                    color:Colors.blue ,
                    child: CustomPaint(
                      foregroundPainter: RectanglePaint(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    width: 300,
                    color:Colors.grey ,
                    child: CustomPaint(
                      foregroundPainter: ArcPaint(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: image==null?CircularProgressIndicator():Container(
                      height: 200,
                      width: 200,
                      color:Colors.orange ,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: SizedBox(
                          width: image!.width.toDouble(),
                          height: image!.height.toDouble(),
                          child: CustomPaint(
                            foregroundPainter: ImagePaint(image!),
                          ),
                        ),
                      ),
                    )

                  ),

                ],
              ),
            ),
          ),
        )
       );
  }
}

class ImagePaint extends CustomPainter {
  late final ui.Image image;
   ImagePaint(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    canvas.drawImage(image, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}

class ArcPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint2=Paint()
      ..color=Colors.red
      ..strokeWidth=10
      ..style=PaintingStyle.stroke;

    final arc1=Path();
    arc1.moveTo(size.width*0.2, size.height*0.2);
    arc1.arcToPoint(Offset(size.width*0.9, size.height*0.2),radius: Radius.circular(200),clockwise: false,largeArc: false);

   canvas.drawPath(arc1, paint2);

  }

  @override
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;

}

class RectanglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint=Paint()
        ..color=Colors.white
      ..strokeWidth=10
    ..style=PaintingStyle.stroke;

    final paint1=Paint()
        ..color=Colors.red
      ..strokeWidth=10
    ..style=PaintingStyle.fill;

    final center=Offset(size.width/2,size.height/2);
    final a=Offset(size.width*1/4,size.height*1/4);
    final b=Offset(size.width*3/4,size.height*3/4);
    final rect=Rect.fromPoints(a, b);
    final radius=Radius.circular(50);


    canvas.drawCircle(center, size.width*1/8, paint1);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    canvas.drawRect(rect, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>false;
}


class LinePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  final paint=Paint()
    ..color=Colors.brown
    ..strokeCap=StrokeCap.round
   ..strokeWidth=15;
  canvas.drawLine(Offset(size.width*1/6,size.height*1/2), Offset(size.width*5/6,size.height*1/2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;
}