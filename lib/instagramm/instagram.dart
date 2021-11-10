import 'package:advance_flutter/instagramm/reels.dart';
import 'package:advance_flutter/instagramm/search.dart';
import 'package:advance_flutter/instagramm/user_account.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'likes.dart';

class Instagram extends StatefulWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {

  int currentIndex=0;
  List<Widget> pages=<Widget>[Home(),Search(),Reels(),Likes(),UserAccount()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child: pages.elementAt(currentIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        elevation: 5,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,),
              label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.white,),
              label: "",

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.slideshow,color: Colors.white,),
              label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,color: Colors.white,),
              label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.white,),
              label: "",
          ),

        ],
      ),
    );
  }
}
