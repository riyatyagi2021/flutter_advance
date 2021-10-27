import 'package:advance_flutter/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  _LoginGoogleState createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {

   FirebaseAuth auth=FirebaseAuth.instance;
  GoogleSignIn googleSignIn=GoogleSignIn();

  /*late User userr;
  var a=userr!.userr!.email;*/

   Future<User?>  signIn() async{
       GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
       GoogleSignInAuthentication gsa=await googleSignInAccount!.authentication;

       OAuthCredential credential=GoogleAuthProvider.credential(
         accessToken: gsa.accessToken,
         idToken:gsa.idToken
       );

       UserCredential authResult=await auth.signInWithCredential(credential);

      User? user=await authResult.user;

      print("Username: ${user!.displayName}");
      print("Email: ${user!.email}");
      print("Image: ${user!.photoURL}");

       return user;
     }


     void signOut(){
     googleSignIn.signOut();
     print("user signed out");
     }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: ListView(
        children:[

          Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
         // margin: EdgeInsets.only(top: 36),
          child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                Positioned(
                  top: 20,
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Container(
                    //alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    height: 680,
                    width: 350,
                    //color: Colors.white,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Lottie.network('https://assets2.lottiefiles.com/private_files/lf30_hnpeurxv.json'),
                          SizedBox(height: 10,),
                          Text("Welcome back!",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                          Text("Login to your existed account",textAlign: TextAlign.center,style: TextStyle(color: Colors.black.withAlpha(50),fontSize: 15),),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "riyatyagi@mobcoder.com",
                                  prefixIcon:  Icon(Icons.person,size: 20,color: Colors.blue,),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.blue,width: 1),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  prefixIcon:  Icon(Icons.lock,size: 20,),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color:Colors.blue,width: 1),
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40)
                                  )
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 120, top: 0),
                              child: GestureDetector(
                                onTap: () {
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()));*/
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              )),
                          Center(
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                              child: RaisedButton(
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Colors.blue[800],
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  onPressed:(){}
                              ),
                            ),
                          ),
                          Text("or connect using",textAlign: TextAlign.center,style: TextStyle(color: Colors.black.withAlpha(50),fontSize: 15),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: RaisedButton(
                                    color:Colors.indigo,
                                    onPressed: (){
                                      signOut();
                                    },
                                    child:Text(
                                      "f  Facebook",
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),

                                  )),
                              SizedBox(width: 10,),
                              Container(
                                  child: RaisedButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      signIn();
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Hello()));
                                      // await googleSignIn.signIn();
                                      // setState(() {
                                      //
                                      // });
                                    },
                                    child: Text(
                                      "G Google",
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(height: 5,),
                          RichText(
                            text: TextSpan(
                                text: "Don't have an account?  ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.5)),
                                children: [
                                  TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        /*Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 ));*/
                                      },
                                  )
                                ]),
                          ),


                        ],
                      ),
                    ),
                  ),
                )

              ]

          ),
        ),
        ]

      ),
    );
  }
}
