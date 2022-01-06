import 'dart:async';

import 'package:advance_flutter/Utils/utilclasses.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';

class Check extends StatelessWidget {
  static final String title = 'Has Internet?';

  @override
  Widget build(BuildContext context) => OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: InternetCheck(),
        ),
      );
}

class InternetCheck extends StatefulWidget {
  const InternetCheck({Key? key}) : super(key: key);

  @override
  _InternetCheckState createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  late StreamSubscription subscription;
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    check().then((internet) {
                      if (internet != null && internet) {
                        Fluttertoast.showToast(msg: "Yes, internet is there");
                      } else {
                        Fluttertoast.showToast(msg: "Noooo internet is there");
                      }
                    });
                  },
                  child: Text("Check Internet Connection")),
              ElevatedButton(
                  onPressed: () async {
                    final result = await Connectivity().checkConnectivity();
                    showConnectivitySnackBar(result);
                  },
                  child: Text("Check which Internet Connection?")),
            ],
          ),
        ),
      ),
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? 'You are connected to ${result.name.toString()}'
        : 'You have no internet';
    final color = hasInternet ? Colors.green : Colors.red;

    Utils.showTopSnackBar(context, message, color);
  }
}
