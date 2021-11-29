import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTime  currentDate=DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Completer<WebViewController> _controller = Completer<WebViewController>();




  Future<void> selectDate(BuildContext context)async {
   final DateTime? datePicked=await showDatePicker(
       context: context,
       initialDate: currentDate,
       firstDate: DateTime(2000),
       lastDate: DateTime(2050),);
   if (datePicked != null && datePicked != currentDate)
     setState(() {
       currentDate = datePicked;
     });
  }

  Future<void>  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial);
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  launchURL() async{            //add queries sectio in manifest for url opening
    var url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      print("ghjdssss");
    launch(url,forceWebView: true,enableJavaScript: true);
    } else {
    throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(currentDate.toString()),
              ElevatedButton(
                child: Text("Select Date"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, padding: EdgeInsets.all(20)),
                onPressed: () => selectDate(context)
              ),
                  SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text("Choose Time"),
              ),
              Text("${selectedTime.hour}:${selectedTime.minute}"),
              SizedBox(height: 20,),
              ElevatedButton(

                  child: Text("Open this URL"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, padding: EdgeInsets.all(20)),
                  onPressed: (){

                    launchURL();
                  }
              ),
              Container(
                height: 500,
                width: 370,
                child: WebView(
                  initialUrl: 'https://google.com',
                  //javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
