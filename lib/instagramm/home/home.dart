import 'package:advance_flutter/instagramm/home/stories.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        automaticallyImplyLeading: false,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontFamily: 'Lobster'),
        ),
        actions: [
          Icon(
            Icons.add_box_outlined,
            color: Colors.black,
            size: 30,
          ),
          Container(
              margin: EdgeInsets.only(right: 20, left: 30),
              child: Icon(
                Icons.messenger_outline_sharp,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index)=>index==0
          ?  SizedBox(
            child: Stories(),
            height: deviceSize.height * 0.18,
          ):Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 540,
                // width:400,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8,left: 15,bottom: 8,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                TextStyle(color: Colors.black, fontSize: 18),
                              )
                            ],
                          ),
                          Icon(
                            Icons.more_vert_rounded,
                            color: Colors.black,
                            size: 27,
                          ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 27,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.mode_comment_outlined,
                                color: Colors.black,
                                size: 27,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.near_me_outlined,
                                color: Colors.black,
                                size: 27,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.bookmark,
                            color: Colors.black,
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
                        TextStyle(color: Colors.black, fontSize: 14),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Row(
                        children: [
                          Text("riyaa_tyagi",style:
                          TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 14),),
                          SizedBox(width: 10,),
                          Text("See my new bunglow",style:
                          TextStyle(color: Colors.black, fontSize: 14),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("View all comments",style:
                      TextStyle(color: Colors.black.withAlpha(155),fontWeight: FontWeight.bold, fontSize: 14),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile.png',
                                    height: 30,
                                    width: 30,
                                  )),
                              SizedBox(width: 15,),
                              Container(
                                height: 20,
                                width: 150,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Add a comment.....",
                                    hintStyle: TextStyle(color: Colors.black.withAlpha(155), fontWeight: FontWeight.bold,fontSize: 14),
                                  ),
                                ),
                              ),
                              //SizedBox(width: 115,),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite,color: Colors.red,size: 20,),
                              SizedBox(width: 10,),
                              Icon(Icons.thumbs_up_down_sharp,color: Colors.yellow,size: 20,),
                              SizedBox(width: 10,),
                              Icon(Icons.add_circle_outline,color: Colors.black,size: 20,),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("2 Days ago",style:
                      TextStyle(color: Colors.black.withAlpha(155), fontSize: 10),),
                    ),

                  ],
                ),
              )
            ],
          )

        ),
      ),
    );
  }
}











