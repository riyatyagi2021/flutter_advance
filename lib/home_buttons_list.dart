import 'package:advance_flutter/instagramm/instagram.dart';
import 'package:advance_flutter/main.dart';
import 'package:advance_flutter/tasks_given/add_time_slot.dart';
import 'package:advance_flutter/tasks_given/add_ui.dart';
import 'package:advance_flutter/others/animation3.dart';
import 'package:advance_flutter/others/animations.dart';
import 'package:advance_flutter/others/animations2.dart';
import 'package:advance_flutter/others/canvas_objets.dart';
import 'package:advance_flutter/others/date_time_web_url.dart';
import 'package:advance_flutter/others/dropdown_list.dart';
import 'package:advance_flutter/tasks_given/edit_time_slot.dart';
import 'package:advance_flutter/tasks_given/edit_ui.dart';
import 'package:advance_flutter/others/bottomsheet.dart';
import 'package:advance_flutter/others/flare_animations.dart';
import 'package:advance_flutter/others/google_map.dart';
import 'package:advance_flutter/others/stackoverflow.dart';
import 'package:advance_flutter/tasks_given/enable_mode.dart';
import 'package:advance_flutter/widgets/list_of_widgets.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

import 'others/dialog_popup.dart';
import 'others/shimmer_effect.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  int counter = 0;
  late DatabaseReference dbr;
  String databaseJson = "";
  int countValue = 0;



//// Animationnnsss for page routing
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Instagram(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 2.0);
        const end = Offset.zero;
        const curve = Curves.slowMiddle;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      RemoteNotification? notification = msg.notification;
      AndroidNotification? android = msg.notification?.android;

      print("gfdcvbn" + msg.toString());

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: Colors.blue,
                    //  ledColor: Colors.purple,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {
      RemoteNotification? notification = msg.notification;
      AndroidNotification? android = msg.notification?.android;

      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title ?? ''),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body ?? '')],
                  ),
                ),
              );
            });
      }
    });

    dbr = FirebaseDatabase.instance.reference();
    dbr.child("myCounter").child("Key_Counter").onValue.listen((event) {
      print("Counter update" + event.snapshot.value.toString());
      setState(() {
        countValue = event.snapshot.value;
      });
    });
  }

  void showNotifications() {
    setState(() {
      counter++;
    });

    flutterLocalNotificationsPlugin.show(
        0,
        "Testing ${counter}",
        "Good evening",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.name, channel.id,
                channelDescription: channel.description,
                color: Colors.red,
                importance: Importance.high,
                playSound: true,
                icon: "@mipmap/ic_launcher"
                //  ledColor: Colors.pink
                )));
  }

  void crash() {
    var arr = [6, 7];
    print(arr[8]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
          child: ListView(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Hello Notification ${counter}")),
                  ElevatedButton(
                    child: Text("See notifications"),
                    onPressed: showNotifications,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(countValue.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text("database json - $databaseJson"),
                  ),
                  ElevatedButton(
                    child: Text("Create Database"),
                    onPressed: createDB,
                  ),
                  ElevatedButton(
                    child: Text("Read DB at once"),
                    onPressed: readatOnce,
                  ),
                  ElevatedButton(
                    child: Text("Read one child"),
                    onPressed: readOneChild,
                  ),
                  ElevatedButton(
                    child: Text("Update Value"),
                    onPressed: updateValue,
                  ),
                  ElevatedButton(
                    child: Text("Delete Value"),
                    onPressed: deleteValue,
                  ),
                  ElevatedButton(
                    child: Text("Update value by 1"),
                    onPressed: updateby1,
                  ),
                  ElevatedButton(
                    child: Text("Call Satish Tiwari"),
                    onPressed: () => launch("tel://7409616828"),
                  ),
                  ElevatedButton(
                    child: Text("Open your mail"),
                    onPressed: () => launch("mailto://riya.mobcoder@gmail.com"),
                  ),
                  ElevatedButton(
                    child: Text("Dropdown List"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => FirstPage())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Google Map"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => GoogleMaps())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Open Instagram"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context,  _createRoute(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Animations"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Animations())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Shimmer Effect"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ShimmerEffect())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Date and Time Picker"),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0XFFe8320e), padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DatePicker())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Canvas"),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(196, 97, 212,1), padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => CanvasPractice())),
                  ), SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AddMode())),
                  ), SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Edit"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EditMode())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("StackOverflow"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Ani())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("BottomSheet"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Extra())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Dialogs"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DialogAndPopUp())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("ANimation2"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ANimations())),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Flare"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => FlareAni()),
                  )),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("Animation3"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Animation3()),
                  )),SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("AddTimeSlot"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AddTimeSlot()),
                  )),SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("EditTimeSLot"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EditTimeSlot()),
                  )),SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("EnableMode"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, padding: EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => EnableMode()),
                  )
                  ),SizedBox(height: 20,),
                  CupertinoButton(
                    child: Text("Widgetssss"),
                    color: Colors.red,
                    // style: ElevatedButton.styleFrom(
                    //     primary: Colors.grey, padding: EdgeInsets.all(50)),
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => WidgetsList()),
                  )),
                ],
              ),
            ]

          )),
    );
  }

  createDB() {
    dbr.child("Name").set("Riya Tyagi");
    dbr.child("Profile").set("Flutter developer");
    dbr.child("Websites").set({
      'website1': "www.riya.com",
      'website2': "www.riyaaaaa.com",
    });
  }

  updateValue() {
    dbr.update({'Name': "Riya Bhardwaj"});
    dbr.update({'Profile': "Android developer"});
  }

  readatOnce() {
    dbr.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        databaseJson = dataSnapshot.value.toString();
      });
    });
  }

  readOneChild() {
    dbr
        .child("Websites")
        .child("website2")
        .once()
        .then((DataSnapshot dataSnapshot) {
      setState(() {
        databaseJson = dataSnapshot.value.toString();
      });
    });
  }

  deleteValue() {
    dbr.child("Websites").remove();
  }

  updateby1() {
    dbr.child("myCounter").update({'Key_Counter': countValue + 1});
  }
}
