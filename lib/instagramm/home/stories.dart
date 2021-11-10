import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final stories = Expanded(
      flex: 1,
      child: Container(
        // margin: const EdgeInsets.all(3.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => index == 0
              ? Column(
                  children: [
                    Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        overflow: Overflow.visible,
                        children: [
                      ClipOval(
                          child: Image.asset(
                        'assets/images/anime.jpeg',
                        height: 60,
                        width: 60,
                      )),
                      Positioned(
                          bottom: 10,
                          right: -8,
                          child: Icon(
                            Icons.add_circle_outlined,
                            color: Colors.blue,
                          ))
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Text("Your Story",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                )
              : Column(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      'assets/images/ani.jpeg',
                      height: 60,
                      width: 60,
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
                      child: Text("Your Story",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    )
                  ],
                ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return new Container(
      color:Colors.white ,
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          stories,
        ],
      ),
    );
  }
}
