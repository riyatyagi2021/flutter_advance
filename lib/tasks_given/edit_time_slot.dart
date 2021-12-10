import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTimeSlot extends StatefulWidget {
  const EditTimeSlot({Key? key}) : super(key: key);

  @override
  _EditTimeSlotState createState() => _EditTimeSlotState();
}

class _EditTimeSlotState extends State<EditTimeSlot> {
  var _Fromvalue = '1';
  var _Tovalue = '1';
  bool toggle = true;   //Canvas togggle
  bool status=false;   //imported package
  bool mon=false;
  bool tue=false;
  bool wed=false;
  bool thu=false;
  bool fri=false;
  bool sat=false;
  bool sun=false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit a Time Slot"),
        automaticallyImplyLeading: false,
      ),

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: true,
        child: Container(
          height: 700,
          width: MediaQuery.of(context).size.width,
          child: Stack(
              children:[
                Container(
                  margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: "Time Slot Name ",
                            style: TextStyle(
                              //color: Color(0xff919191),
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: '*',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ]),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [

                          Expanded(
                            flex: 8,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(25),
                                ],

                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(

                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  border:  OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  fillColor: Color(0xffdeeffb),
                                  filled: true,
                                  hintText: 'Enter time slot name',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff0a80c9),
                                ),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("?",style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14))),
                              ))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Monday',
                        style: TextStyle(
                            color: Color(0xff0a80c9),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Active from:',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: 155,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              left: 18.0,),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:BorderSide(color: Colors.blue, width: 1) ,
                                              borderRadius:
                                              BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0) ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0) ),
                                              borderSide: BorderSide(width: 1,color: Colors.blue),
                                            ),
                                            fillColor: Color(0xffdeeffb),
                                            filled: true,
                                            hintText: '00:00',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,

                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.only(topRight: Radius.circular(5.0),bottomRight: Radius.circular(5.0) ),
                                              border: Border.all(color: Colors.blueAccent)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: DropdownButton(
                                              icon: Icon(Icons.expand_more, color: Color(0xff0a80c9),),
                                              underline: Container(),
                                              onChanged: (String? valuee) {
                                                setState(() {
                                                  _Fromvalue = valuee!;
                                                });
                                              },
                                              value: _Fromvalue,
                                              items: [
                                                DropdownMenuItem(
                                                  value: "1",
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      Text(
                                                        "AM",
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: "2",
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      Text(
                                                        "PM",
                                                        style: TextStyle(
                                                          fontSize: 16.0,),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Active to:',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: 155,
                                  height: 45,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: TextField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              left: 18.0,),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide:BorderSide(color: Colors.blue, width: 1) ,
                                              borderRadius:
                                              BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0) ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0) ),
                                              borderSide: BorderSide(width: 1,color: Colors.blue),
                                            ),
                                            fillColor: Color(0xffdeeffb),
                                            filled: true,
                                            hintText: '00:00',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,

                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.only(topRight: Radius.circular(5.0),bottomRight: Radius.circular(5.0) ),
                                              border: Border.all(color: Colors.blueAccent)
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: DropdownButton(
                                              icon: Icon(Icons.expand_more, color: Color(0xff0a80c9),),
                                              underline: Container(),
                                              onChanged: (String? valuee) {
                                                setState(() {
                                                  _Tovalue = valuee!;
                                                });
                                              },
                                              value: _Tovalue,
                                              items: [
                                                DropdownMenuItem(
                                                  value: "1",
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      Text(
                                                        "AM",
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: "2",
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: <Widget>[
                                                      Text(
                                                        "PM",
                                                        style: TextStyle(
                                                          fontSize: 16.0,),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enable Time Slot for 24 hours',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16
                                // fontWeight: FontWeight.w600
                              ),
                            ),
                            toggle
                                ? Container(
                              //  color: Colors.green,
                              height: 50,
                              width: 60,
                              // color:Colors.orange ,
                              child: GestureDetector(
                                child: CustomPaint(
                                  painter: ToggleON(),
                                ),
                                onTap: () {
                                  setState(() {
                                    toggle = !toggle;
                                  });
                                },
                              ),
                            )
                                : Container(
                              height: 50,
                              width: 60,
                              //color: Colors.green,
                              //  color:Colors.orange ,
                              child: GestureDetector(
                                child: CustomPaint(
                                  painter: ToggleOFF(),
                                ),
                                onTap: () {
                                  setState(() {
                                    toggle = !toggle;
                                  });
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Divider(
                        thickness: 2,),
                      SizedBox(height: 15,),
                      Text("Copy to days",style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16
                        // fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("MON",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: mon,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    mon = value!;
                                  });
                                }, ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("TUE",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: tue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    tue = value!;
                                  });
                                }, ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("WED",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: wed,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    wed = value!;
                                  });
                                }, ),
                            ],
                          ),

                          Column(
                            children: [
                              Text("THU",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: thu,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    thu = value!;
                                  });
                                }, ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("FRI",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: fri,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    fri = value!;
                                  });
                                }, ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("SAT",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: sat,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    sat = value!;
                                  });
                                }, ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("SUN",style: TextStyle(
                                  color: Color(0xff0a80c9),
                                  fontSize: 14
                                // fontWeight: FontWeight.w600
                              ),),
                              Checkbox(  value: sun,
                                shape: RoundedRectangleBorder(
                                  //side:BorderSide(color: Colors.blue,width: 2),
                                    borderRadius: BorderRadius.circular(3)),
                                onChanged: ( value) {
                                  setState(() {
                                    sun = value!;
                                  });
                                }, ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        margin: EdgeInsets.only(top: 60),
                        color: Color(0xff21bce4),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 130,
                                height: 40,
                                margin: EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  border: Border.all(
                                      color: Color(0xff23bde4), width: 1.5),
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "CANCEL",
                                  style: TextStyle(
                                      color: Color(0xff23bde4), fontSize: 18),
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0))),
                              ),
                            ),
                            SizedBox(width: 25,),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 130,
                                height: 40,
                                margin: EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Color(0xff057cc7),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]

          ),
        ),
      ),
    );
  }
}

class ToggleON extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;
    final paint1 = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      color: Colors.black, fontSize: 14, );
    final textSpan = TextSpan(
      text: 'ON',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 3;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);

    final a = Offset(size.width * 0.1 / 4, size.height * 1 / 4);
    final b = Offset(size.width * 9.9 / 10, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(50);
    final center = Offset(size.width * 2.4 / 3, size.height / 2);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    canvas.drawCircle(center, size.width * 2.4 / 13, paint1);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ToggleOFF extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style=PaintingStyle.stroke
    ;
    final paint1 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style=PaintingStyle.stroke;

    final textStyle = TextStyle(
        color: Colors.black, fontSize: 14);
    final textSpan = TextSpan(
      text: 'OFF',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 1.2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);

    final a = Offset(size.width * 0.1 / 4, size.height * 1 / 4);
    final b = Offset(size.width * 9.9 / 10, size.height * 3 / 4);
    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(50);
    final center = Offset(size.width * 0.6 / 3, size.height / 2);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
    canvas.drawCircle(center, size.width * 2.31 / 13, paint1);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
