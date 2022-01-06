import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class Utils {
  static void showSnackBar(BuildContext context, {required String title}) =>
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(title)));

  static void showTopSnackBar(
    BuildContext context,
    String message,
    Color color,
  ) =>
      showSimpleNotification(
        Text('Internet Connectivity Update'),
        subtitle: Text(message),
        background: color,
      );
}
