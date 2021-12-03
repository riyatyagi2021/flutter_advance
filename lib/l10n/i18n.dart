
import 'package:flutter/material.dart';
import 'dart:ui';

class L10n {

  static final all=[

    Locale('hi', ''),
    //Locale('es', ''), //spanish
    Locale('en', ''),
  ];



  static String getFlag(String code){

    switch(code){
      case 'hi':return '🇮🇳';
    //  case 'es':return '🇪🇸';
      default: return '🇺🇸';
    }

  }

}