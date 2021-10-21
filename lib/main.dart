import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

void main() { runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Intro(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  List<Slide> slides=[];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        backgroundColor: Colors.white,

        centerWidget:Center(
          child: Container(
            // alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 300),
            padding: EdgeInsets.only(top: 20,left: 40),
            color: Colors.teal.withOpacity(0.5),
            height: 300,
            width: 500,
            // decoration: ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Discover\nPlaces Near You",textAlign: TextAlign.left,style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),),
                SizedBox(height: 10,),
                Text("Find the best properties",style:TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 25
                ),)
              ],
            ),
          ),
        ),
        backgroundImage:'assets/images/villa5.jpeg' ,
        backgroundImageFit: BoxFit.fitHeight,
        backgroundOpacity: 0.0,

      ),
    );

    slides.add(
      Slide(
          centerWidget:Center(
            child: Container(
              margin: EdgeInsets.only(top: 300),
              padding: EdgeInsets.only(top: 20,left: 40),
              color: Colors.teal.withOpacity(0.5),
              height: 300,
              width: 400,

              // decoration: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Search\nProperties Easily",style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                  SizedBox(height: 10,),
                  Text("World's most attractive locations",style:TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                      fontSize:25
                  ),)
                ],
              ),
            ),
          ),
          backgroundImage:'assets/images/villa2.png' ,
          backgroundImageFit: BoxFit.cover

      ),
    );

    slides.add(
      Slide(
          centerWidget:Center(
            child: Container(
              margin: EdgeInsets.only(top: 300),
              padding: EdgeInsets.only(top: 20,left: 40),
              color: Colors.teal.withOpacity(0.5),
              height: 300,
              width: 400,
              // decoration: ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ready to move\nProperties",style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                  SizedBox(height: 10,),
                  Text("Become part of our success story",style:TextStyle(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize:25
                  ),)
                ],
              ),
            ),
          ),
          backgroundImage:'assets/images/villa5.jpeg' ,
          backgroundImageFit: BoxFit.fitHeight

        // widthImage: 350,
        // heightImage:  700,

      ),
    );
  }

  void onDonePress(){
    /*Navigator.push(
           context,
          MaterialPageRoute(builder: (context) => PageSecond()),
         );*/
  }

  void onSkipPress(){
  /*  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageSecond()),
    );*/
  }

  Widget renderSkipBtn(){
    return Text(
      "Skip", style: TextStyle(fontSize: 15,color: Colors.black),
    );
  }

  Widget renderNxtBtn(){
    return Icon(
      Icons.navigate_next,
      color: Colors.black,
    );
  }

  Widget renderDonebtn(){
    return Text(
      "Done", style: TextStyle(fontSize: 15,color: Colors.black),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(Colors.green),
    );
  }


  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,

      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      skipButtonStyle: myButtonStyle(),

      renderNextBtn: this.renderNxtBtn(),
      nextButtonStyle: myButtonStyle(),

      renderDoneBtn: this.renderDonebtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),


      colorDot: Colors.white,
      colorActiveDot: Colors.green,
      // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      sizeDot: 15.0,

      hideStatusBar: true,
      backgroundColorAllSlides: Colors.blue,


      //verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}

