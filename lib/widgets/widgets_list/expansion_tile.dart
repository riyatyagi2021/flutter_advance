import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({Key? key}) : super(key: key);

  @override
  _ExpansionTileDemoState createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  UniqueKey? key;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 450,
                width: 350,
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  color: Colors.cyan,
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      GestureDetector(
                          onTap: () => isExpanded ? shrink() : expand(),
                          child: buildImage()),
                      buildText(),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Image.asset(
        'assets/images/profile.png',
        fit: BoxFit.fitWidth,
        width: double.infinity,
        height: 300,
      );

  Widget buildText() => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ExpansionTile(
          key: key, //everytime new tile is created, done to shrink and expand
          initiallyExpanded: isExpanded,
          collapsedIconColor: Colors.red,
          collapsedTextColor: Colors.orange,
          collapsedBackgroundColor: Colors.blueGrey,
          childrenPadding: EdgeInsets.all(10).copyWith(top: 0),
          backgroundColor: Colors.green,
          title: Text(
            "About Expansion Tile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.yellow),
          ),
          children: [
            Text(
              " In many application, you have seen an expansion or a collapsed view like the above \n There are two ways of creating an expandable view in Flutter : \n ExpansionTile \n  ExpansionPanelList & ExpansionPanel",
              style: TextStyle(height: 1, fontSize: 14, color: Colors.white),
            )
          ],
        ),
      );

  void shrink() {
    setState(() {
      isExpanded = false;
      key = UniqueKey();
    });
  }

  void expand() {
    setState(() {
      isExpanded = true;
      key = UniqueKey();
    });
  }
}
