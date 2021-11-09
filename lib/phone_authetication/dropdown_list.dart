import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
   String? chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown list"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: chosenValue,
                elevation: 1,
                style: TextStyle(color: Colors.red),
                items: <String>[
                  'India',
                  'Nepal',
                  'Paris',
                  'Japan',
                  'UK',
                  'Singapore',
                  'Germany',
                  'France',
                  'Australia',
                  'India',
                  'Nepal',
                  'Paris',
                  'Japan',
                  'UK',
                  'Singapore',
                  'Germany',
                  'France',
                  'Australia',
                  'India',
                  'Nepal',
                  'Paris',
                  'Japan',
                  'UK',
                  'Singapore',
                  'Germany',
                  'France',
                  'Australia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Please choose a country",
                    style: TextStyle(
                      backgroundColor: Colors.orange,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onChanged: (String? value){
                  setState(() {
                    chosenValue=value!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
