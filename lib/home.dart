import 'package:advance_flutter/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';


class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  int counter = 0;
  late DatabaseReference dbr;
 String databaseJson="";
 int countValue=0;

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

    dbr=FirebaseDatabase.instance.reference();
    dbr.child("myCounter").child("Key_Counter").onValue.listen((event) {
      print("Counter update" + event.snapshot.value.toString());
      setState(() {
        countValue=event.snapshot.value;
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
      body: Center(
          child: Column(
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
          ), ElevatedButton(
            child: Text("Read DB at once"),
            onPressed: readatOnce,
          ), ElevatedButton(
            child: Text("Read one child"),
            onPressed: readOneChild,
          ), ElevatedButton(
            child: Text("Update Value"),
            onPressed: updateValue,
          ), ElevatedButton(
            child: Text("Delete Value"),
            onPressed: deleteValue,
          ), ElevatedButton(
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
        ],
      )),
    );
  }

  createDB() {
   dbr.child("Name").set("Riya Tyagi");
   dbr.child("Profile").set("Flutter developer");
   dbr.child("Websites").set({'website1':"www.riya.com",'website2':"www.riyaaaaa.com",});
  }

  updateValue(){
    dbr.update({'Name': "Riya Bhardwaj"});
    dbr.update({'Profile': "Android developer"});
  }

   readatOnce() {
    dbr.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        databaseJson=dataSnapshot.value.toString();
      });
    });
  }

   readOneChild(){
    dbr.child("Websites").child("website2").once().then((DataSnapshot dataSnapshot) {
      setState(() {
        databaseJson=dataSnapshot.value.toString();
      });
    });
   }

   deleteValue(){
    dbr.child("Websites").remove();
   }

   updateby1() {
    dbr.child("myCounter").update({'Key_Counter': countValue+1});
  }



}
