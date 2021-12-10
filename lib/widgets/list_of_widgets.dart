import 'package:advance_flutter/widgets/widgets_list/absorb_pointer.dart';
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
                    constraints: BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 300
                    ),
                    child: ShaderMask(
                        shaderCallback: (rect){
                          return RadialGradient(
                              radius: 1,
                              center: Alignment.topLeft,
                              tileMode: TileMode.mirror,
                              colors:[Colors.yellow, Colors.red]
                          ).createShader(rect);
                        }
                          ,

                        child: const Text("RIYA ",style: TextStyle(fontSize: 100),))),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text("Silver App Bar"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green, padding: EdgeInsets.all(20)),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AbsorbPainter())),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
