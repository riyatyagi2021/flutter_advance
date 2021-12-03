import 'package:advance_flutter/l10n/i18n.dart';
import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier{

  Locale? _locale;

  Locale? get locale=> _locale;

  void setLocale(Locale locale){
    if(!L10n.all.contains(locale))
      return;
    _locale= locale;
    notifyListeners();
  }

  void clearLocale(){
    _locale=null;
    notifyListeners();
  }


}