import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../home_main.dart';

class OtpScreen extends StatefulWidget {

 final String numberHolder;
   OtpScreen({Key? key, required this.numberHolder}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  late String verificationCode;

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

@override
  void initState() {
    super.initState();
    verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Verify otp received on\n   +91  ${widget.numberHolder}",textAlign:TextAlign.center,
          style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PinPut(
              fieldsCount: 6,
              withCursor: true,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 55.0,
              eachFieldHeight: 55.0,
              onSubmit: ( pin) async {
                try {
                  await FirebaseAuth.instance.signInWithCredential(
                    PhoneAuthProvider.credential(verificationId: verificationCode, smsCode: pin)
                  ).then((value){
                    if(value!=null){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Hello())
                      );
                    }
                  });
                }  catch (e) {
                  FocusScope.of(context).unfocus();
                  Fluttertoast.showToast(msg: "Wrong otp");
                }
              },
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
            ),
          ),

            ],
          ),
        ),
      ),
    );
  }


  verifyPhone() async{
   await FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: '+91${widget.numberHolder}',
       verificationCompleted: (PhoneAuthCredential credential) async {
         await FirebaseAuth.instance.signInWithCredential(credential).
         then((value)async{
           if(value.user!=null){
             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Hello())
             );
           }
         });
       },

       verificationFailed: (FirebaseAuthException e) {
         if (e.code == 'invalid-phone-number') {
           print('The provided phone number is not valid.');
         }
         print("My api exception ${e.message}");
       },
       codeSent: (String verificationId, int? resendToken) {
         setState(() {
           verificationCode=verificationId;
         });
       },
       codeAutoRetrievalTimeout:(String verificationId) {
         setState(() {
           verificationCode=verificationId;
         });
       },
       timeout: Duration(seconds: 30),

   );}


}
