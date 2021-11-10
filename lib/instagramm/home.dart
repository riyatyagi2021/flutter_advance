import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        automaticallyImplyLeading: false,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'Lobster'),
        ),
        actions: [
          Icon(
            Icons.add_box_outlined,
            color: Colors.white,
            size: 30,
          ),
          Container(
              margin: EdgeInsets.only(right: 20, left: 30),
              child: Icon(
                Icons.messenger_outline_sharp,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return  Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(top: 20),

                        child: Column(
                          children: [
                            Stack(
                                alignment:AlignmentDirectional.bottomEnd,
                                children: [
                                  ClipOval(
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        height: 60,
                                        width: 60,
                                      )),
                                  Positioned(
                                      bottom: 10,
                                      right: -3,
                                      child: Icon(
                                        Icons.add_circle_outlined,
                                        color: Colors.blue,
                                      ))
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 5),
                              child: Text("Your Story",style:
                              TextStyle(color: Colors.white, fontSize: 14)),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 60,
                                width: 60,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 5),
                            child: Text("Your Story",style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 60,
                                width: 60,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 5),
                            child: Text("Your Story",style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 60,
                                width: 60,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 5),
                            child: Text("Your Story",style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 60,
                                width: 60,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 5),
                            child: Text("Your Story",style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ClipOval(
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 60,
                                width: 60,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,top: 5),
                            child: Text("Your Story",style:
                            TextStyle(color: Colors.white, fontSize: 14)),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),


                Container(
                  color: Colors.black,
                  height: 540,
                  width: 360,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8,left: 15,bottom: 8),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipOval(
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  height: 40,
                                  width: 40,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "riyaa_tyagi",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Icon(
                              Icons.more_vert_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/villa5.jpeg',
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 27,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                              size: 27,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.near_me_outlined,
                              color: Colors.white,
                              size: 27,
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: 27,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/profile.png',
                                          height: 30,
                                          width: 30,
                                        ))),
                                Container(
                                    margin: EdgeInsets.only(left: 40),
                                    child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/profile.png',
                                          height: 30,
                                          width: 30,
                                        ))),
                                Container(
                                    margin: EdgeInsets.only(left: 60),
                                    child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/profile.png',
                                          height: 30,
                                          width: 30,
                                        ))),
                              ]),
                          SizedBox(width: 10,),
                          Text("Liked by abcd and 110 others",style:
                          TextStyle(color: Colors.white, fontSize: 14),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        child: Row(
                          children: [
                            Text("riyaa_tyagi",style:
                            TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 14),),
                            SizedBox(width: 10,),
                            Text("See my new bunglow",style:
                            TextStyle(color: Colors.white, fontSize: 14),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("View all comments",style:
                        TextStyle(color: Colors.white.withAlpha(155),fontWeight: FontWeight.bold, fontSize: 14),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        child: Row(
                          children: [
                            ClipOval(
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  height: 30,
                                  width: 30,
                                )),
                            SizedBox(width: 15,),
                            Text("Add a comment.....",style:
                            TextStyle(color: Colors.white.withAlpha(155), fontSize: 14),),
                            SizedBox(width: 75,),
                            Icon(Icons.favorite,color: Colors.red,size: 20,),
                            SizedBox(width: 10,),
                            Icon(Icons.thumbs_up_down_sharp,color: Colors.yellow,size: 20,),
                            SizedBox(width: 10,),
                            Icon(Icons.add_circle_outline,color: Colors.white,size: 20,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("2 Days ago",style:
                        TextStyle(color: Colors.white.withAlpha(155), fontSize: 10),),
                      ),

                    ],
                  ),
                )
              ],
            );
          },

        ),
      ),
    );
  }
}











