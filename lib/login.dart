

import 'package:advance_flutter/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {

  TextEditingController number=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),

        child:Scaffold(
          body: Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 100),
              child: ListView(
                children:[
                  Column(
                    children: [
                      Text(" Enter Phone number",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: number,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8),
                            child: Text("+91"),
                          ),
                            hintText: "Enter number"
                        ),
                      ),
                      SizedBox(height: 100,),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpScreen(numberHolder:number.text))
                            );
                          },
                        child: Text("Verify Otp"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black
                        ),
                      )

                    ],
                  )

                ]
                ,
              ),
            ),
          ),
        )
    );
  }
}








