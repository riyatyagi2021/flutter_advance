import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AddMode extends StatefulWidget {
  const AddMode({Key? key}) : super(key: key);

  @override
  _AddModeState createState() => _AddModeState();
}

class _AddModeState extends State<AddMode> {
  @override
  Widget build(BuildContext context) {
    bool status3=false;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Add a New Mode',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        body:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children:[
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 15,right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mode Name*",
                            style: TextStyle(
                                color: Color(0xff919191),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(25),
                              ],
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                fillColor: Color(0xffdeeffb),
                                filled: true,
                                hintText: 'Enter Mode name',
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            "Minutes per token (e.g.5)*",
                            style: TextStyle(
                                color: Color(0xff919191),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                fillColor: Color(0xffdeeffb),
                                filled: true,
                                hintText: 'Enter the number of minutes to earn one token',
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mode Picture',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          // fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Upload Picture to the right',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35.0),
                                        color: Color(0xff9fbed2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.camera_alt_rounded,color: Colors.white,size: 40,),
                                    )
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
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
                                      child: TextField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(25),
                                        ],
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(
                                              left: 4.0,),
                                            border: const OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                            fillColor: Color(0xffdeeffb),
                                            filled: true,
                                            hintText: 'Choose a date',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            suffixIcon: Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.blue,
                                            )),
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
                                      child: TextField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(25),
                                        ],
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.only(
                                              left: 4.0,),
                                            border: const OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(5.0)),
                                            ),
                                            fillColor: Color(0xffdeeffb),
                                            filled: true,
                                            hintText: 'Choose a date',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                            suffixIcon: Icon(
                                              Icons.calendar_today,
                                              color: Colors.blue,
                                            )),
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
                                  'Never expires',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16
                                    // fontWeight: FontWeight.w600
                                  ),
                                ),
                                Container(
                                  height:30,
                                  child: FlutterSwitch(
                                    showOnOff: true,
                                    activeTextColor: Colors.white,
                                    inactiveTextColor: Colors.black,
                                    value: status3,
                                    onToggle: (val) {
                                      setState(() {
                                        status3 = val;
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
                          SizedBox(height: 20,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Advanced Settings',
                                        style: const TextStyle(
                                            decoration: TextDecoration.underline,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () {} /*=> Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()),
                                      ),*/
                                    ),
                                  ),
                                ),
                                Container(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Colors.blue,
                                          size: 35,
                                        )))
                              ],
                            ),
                          ),
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
                            height: 70,
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



      ),
    );
  }
}
