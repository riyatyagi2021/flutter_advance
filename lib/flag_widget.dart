import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/i18n.dart';
import 'locale_provider/locale_provider.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final locale=Localizations.localeOf(context);
    final flag=L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 60,
        child: Text(
          flag,
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}



class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  Locale? localee;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    var locale = provider.locale ;

    print(provider.locale?.languageCode);
    return DropdownButton(
      value: localee,
      icon: Container(width: 8),
      dropdownColor: Colors.green[200],

      iconDisabledColor: Colors.yellow,
      iconEnabledColor: Colors.red,
      items: L10n.all.map(
            (locale) {
          final flag = L10n.getFlag(locale.languageCode);
          print(locale.toString()+"  codes");
          return DropdownMenuItem(
            child: Center(
              child: Text(
                flag,
                style: TextStyle(fontSize: 20),
              ),
            ),
            value: locale,
            onTap: () {
              final provider =
              Provider.of<LocaleProvider>(context, listen: false);
             print(" code after tap "+locale.languageCode);
              provider.setLocale(locale);
            // print(" code after tap and provider value  "+provider.locale!.languageCode.toString());
            },
          );
        },
      ).toList(),
      onChanged: ( value) {
        setState(() {
          localee=value as Locale?   ;
        });
        print(localee.toString()+" value");
      },
    );
  }
}










/*
class LanguagePickerWidget extends StatelessWidget {
  String? choosenValue;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');

    print(provider.locale?.languageCode);

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
              (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            print(flag+"cgxfcvb");
            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                final provider =
                Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (locale) {
          setState(() {
            chosenValue=value!;
          });
        },
      ),
    );
  }
}
*/

