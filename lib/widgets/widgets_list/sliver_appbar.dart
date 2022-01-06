import 'package:flutter/material.dart';

class SliverAppBArr extends StatefulWidget {
  const SliverAppBArr({Key? key}) : super(key: key);

  @override
  _AbsorbPainterState createState() => _AbsorbPainterState();
}

class _AbsorbPainterState extends State<SliverAppBArr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          //  expandedHeight: 100,
          collapsedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("Scrollable Space Bar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ) //TextStyle
                ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Dismissible(
              //direction: DismissDirection.vertical,
              background: Container(
                color: Colors.yellow,
              ),
              secondaryBackground: Container(
                color: Colors.purpleAccent,
              ),
              key: ValueKey(index),
              child: ListTile(
                tileColor: (index % 2 == 0) ? Colors.red : Colors.green[50],
                title: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          color: Colors.greenAccent[400]) //TextStyle
                      ), //Text
                ), //Center
              ),
            ), //ListTile
            childCount: 51,
          ), //SliverChildBuildDelegate
        )
      ],
    ));
  }
}
