/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_buttons_list.dart';




void main() { runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneAuthentication(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {

  // TextEditingController number=TextEditingController();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Container(
                child: Text(" something wrong")
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Hello();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }*/

import 'package:advance_flutter/google_authenticatuon/google_sign_in.dart';
import 'package:advance_flutter/locale_provider/locale_provider.dart';
import 'package:advance_flutter/slider_demo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'flag_widget.dart';
import 'home_buttons_list.dart';
import 'l10n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


// AndroidInitializationSettings('app_icon');

const AndroidNotificationChannel channel=AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
 description: 'This is for sending notifications',
  playSound: true,
  importance: Importance.high,
 // ledColor: Colors.orange,
  //sound: AndroidNotificationSound.
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage msg) async{
  await Firebase.initializeApp();
  print("A bg msg just showed up ${msg.messageId}");
}

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage((firebaseMessagingBackgroundHandler));


  await flutterLocalNotificationsPlugin.
  resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    sound: true,
    alert: true,
    badge: true
  );

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create:(_)=>LocaleProvider(),
    builder:(context,child){
      final provider=Provider.of<LocaleProvider>(context);
      print(provider.locale?.languageCode);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      //darkTheme: ThemeData.dark(),
      home: LanguageChange(),
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,

      locale: provider.locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  });
}

class LanguageChange extends StatefulWidget {
  const LanguageChange({Key? key}) : super(key: key);

  @override
  _LanguageChangeState createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final provider = Provider.of<LocaleProvider>(context, listen: false);

      provider.clearLocale();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          LanguagePickerWidget(),
          SizedBox(width: 20,)
        ],
        title: Text(" Language change"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan[200],
        height: 700,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlagWidget(),
            SizedBox(height: 20,),
            Text(
                AppLocalizations.of(context)!.language,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.red),
            ),
            SizedBox(height: 20,),
            Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black),
            ),
            SizedBox(height: 80,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Intro()),
              );
            },
                child: Text("Next Page"))
          ],
        ),
      ),
    );
  }
}



