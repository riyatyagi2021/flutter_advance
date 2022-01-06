import 'package:advance_flutter/widgets/widgets_list/confetti_animation.dart';
import 'package:advance_flutter/widgets/widgets_list/expansion_tile.dart';
import 'package:advance_flutter/widgets/widgets_list/internet_connection.dart';
import 'package:advance_flutter/widgets/widgets_list/sliver_appbar.dart';
import 'package:flutter/material.dart';

class WidgetsList extends StatefulWidget {
  const WidgetsList({Key? key}) : super(key: key);

  @override
  _WidgetsListState createState() => _WidgetsListState();
}

class _WidgetsListState extends State<WidgetsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                /////constraints
                Container(
                    color: Colors.grey,
                    constraints: BoxConstraints(maxHeight: 150, maxWidth: 300),
                    child: ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                                  radius: 1,
                                  center: Alignment.topLeft,
                                  tileMode: TileMode.mirror,
                                  colors: [Colors.yellow, Colors.red])
                              .createShader(rect);
                        },
                        child: const Text(
                          "RIYA ",
                          style: TextStyle(fontSize: 100),
                        ))),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("Silver App Bar"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(20)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SliverAppBArr())),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("Internet Connectivity"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(20)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Check())),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("Expansion Tile"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(20)),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpansionTileDemo())),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text("Confetti Animation"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(20)),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfettiAnimationn())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
