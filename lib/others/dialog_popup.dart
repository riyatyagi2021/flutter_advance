import 'package:advance_flutter/Utils/utilclasses.dart';
import 'package:flutter/material.dart';

class DialogAndPopUp extends StatefulWidget {
  const DialogAndPopUp({Key? key}) : super(key: key);

  @override
  _DialogAndPopUpState createState() => _DialogAndPopUpState();
}

class _DialogAndPopUpState extends State<DialogAndPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                TextButton(
                    onPressed: () =>showDialog(context: context, builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text("Greetings"),
                        children: [
                          SimpleDialogOption(
                            child: Text("Hello Riya"),
                            onPressed:() {
                              Utils.showSnackBar(context, title: "Thank you");
                              Navigator.pop(context);
                              },
                          ),  SimpleDialogOption(
                            child: Text("Good to see you"),
                            onPressed:() {
                              Navigator.of(context).pop();
                              },
                          ),  SimpleDialogOption(
                            child: Text("Best luck"),
                            onPressed:() {
                              Navigator.of(context).pop();
                              },
                          ),
                      ],);
                    }),
                    child: Text("SimpleDialog"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
                SizedBox(height: 20,),
                TextButton(
                    onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Hey"),
                        content: Text("You are going to be millionaire soon"),
                        backgroundColor: Colors.grey,
                        actions: [
                          OutlinedButton(onPressed:()=> Navigator.of(context).pop(), child: Text("Close"))
                        ],
                      );
                    }),
                    child: Text("AlertDialog"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
                SizedBox(height: 20,),
                TextButton(
                    onPressed: ()=>showDialog(context: context, builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          height: 300,
                          width: 300,
                          color: Colors.lightGreen,
                          child: Center(
                            child: Column(
                              children: [
                                Text("Hey you"),
                                Text("Go and enjoy your life"),
                                Text("Dont waste your time in coding ${'\u2764'}"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close"),
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.all(20),
                                        backgroundColor: Colors.yellow)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                    child: Text("CustomDialog"),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.yellow)),
                SizedBox(height: 20,),
                TextButton(
                    onPressed: ()=>showAboutDialog(
                        context: context,
                        applicationIcon: FlutterLogo(),
                      applicationName: 'Dialog examples',
                      applicationLegalese: 'Riya Tyagi',
                      applicationVersion: '1.1'
                    ),
                    child: Text("AboutDialog"),
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
