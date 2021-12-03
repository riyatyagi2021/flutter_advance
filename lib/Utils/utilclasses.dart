import 'package:flutter/material.dart';

class Utils {

 static void showSnackBar(BuildContext context, {required String title})=>
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));

}