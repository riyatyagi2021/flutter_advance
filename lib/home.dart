import 'package:advance_flutter/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {

  int counter=0;

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
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                    channelDescription: channel.description,
                    color: Colors.blue,
                  //  ledColor: Colors.purple,
                    icon: '@mipmap/ic_launcher'
                )));
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
                    children: [
                      Text(notification.body ?? '')
                    ],
                  ),
                ),

              );
            });
      }
    });
  }


  void showNotifications(){
    setState(() {
      counter++;
    });

    flutterLocalNotificationsPlugin.show(
        0,
        "Testing ${counter}",
        "Good evening",
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.name,
            channel.id,
            channelDescription: channel.description,
            color: Colors.red,
            importance: Importance.high,
            playSound: true,
          icon: "@mipmap/ic_launcher"
          //  ledColor: Colors.pink
          )
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text("Hello ${counter}")),

            ElevatedButton(
              child: Text("See notifications"),
              onPressed:showNotifications,

            )

          ],
        )
      ),
    );
  }
}
