import 'package:flutter/material.dart';

class EnableMode extends StatefulWidget {
  const EnableMode({Key? key}) : super(key: key);

  @override
  _EnableModeState createState() => _EnableModeState();
}

class _EnableModeState extends State<EnableMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          height: 300,
                          width: 300,


                          child: Center(
                            child:
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:BoxDecoration(
                                      color: Color(0xff23bde4),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                                  ),

                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Enable Mode",textAlign: TextAlign.center,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                                  child: Column(
                                    children: [
                                      Text("Are you sure you want to enable \n the mode 'Homework'?",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),),
                                      SizedBox(height: 20,),
                                      Text("The mode will be active again.",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: ()=> Navigator.of(context).pop(),
                                            child: Container(
                                              width: 100,
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
                                                    color: Color(0xff23bde4), fontSize: 16),
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0))),
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: ()=> Navigator.of(context).pop(),
                                            child: Container(
                                              width: 100,
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
                                                "ENABLE",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 16),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                    child: Text("EnableMode"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
                SizedBox(height: 50,),
                TextButton(
                    onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

                        child: Container(
                          height: 300,
                          width: 300,
                          //color: Colors.lightGreen,
                          child: Center(
                            child:

                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:BoxDecoration(
                                      color: Color(0xff23bde4),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Disable Mode",textAlign: TextAlign.center,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20,left: 15,right:15,bottom: 20),
                                  child: Column(
                                    children: [
                                      Text("Are you sure you want to disable \n the mode 'Homework'?",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      SizedBox(height: 20,),
                                      Text("You can enable this mode at any time.",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: ()=> Navigator.of(context).pop(),
                                            child: Container(
                                              width: 100,
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
                                                    color: Color(0xff23bde4), fontSize: 16),
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0))),
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: ()=> Navigator.of(context).pop(),
                                            child: Container(
                                              width: 100,
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
                                                "DISABLE",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 16),
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                    child: Text("DisableMode"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
                SizedBox(height: 50,),
                TextButton(
                    onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          height: 300,
                          width: 300,
                          //color: Colors.lightGreen,
                          child: Center(
                            child:
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration:BoxDecoration(
                                      color: Color(0xff8d1a25),
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
                                  ),

                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Delete Mode",textAlign: TextAlign.center,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30,left: 15,right:15),
                                  child: Column(
                                    children: [
                                      Text("Are you sure you want to delete \n the mode 'Homework'?",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),),
                                      SizedBox(height: 30,),
                                      Text("You will not be able to undo this action.",textAlign: TextAlign.center,style: TextStyle(
                                          color: Color(0xff8d1a25),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      ),),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 54,
                                          margin: EdgeInsets.only(top: 60),
                                          color: Color(0xff21bce4),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 20, left: 20),
                                          child:
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed:()=> Navigator.of(context).pop(),
                                                child: Container(
                                                  width: 100,
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
                                                        color: Color(0xff23bde4), fontSize: 16),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(20.0))),
                                                ),
                                              ),

                                              TextButton(
                                                onPressed: ()=> Navigator.of(context).pop(),
                                                child: Container(
                                                  width: 100,
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
                                                    color: Color(0xff8d1a25),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "DELETE",
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 16),
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
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                    child: Text("DeleteMode"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
