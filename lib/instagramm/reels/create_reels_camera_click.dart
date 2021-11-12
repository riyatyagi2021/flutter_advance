import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class CreateReels extends StatefulWidget {
  List<CameraDescription>? cameras;
   CreateReels({Key? key,this.cameras }) : super(key: key);

  @override
  _CreateReelsState createState() => _CreateReelsState();
}

class _CreateReelsState extends State<CreateReels> {
  CameraController? cameraController;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(widget.cameras![0], ResolutionPreset.max);
    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    cameraController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (!cameraController!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blueGrey,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(cameraController!)),
              if(pictureFile!=null)
                Container(
                    height: 800,
                    width: MediaQuery.of(context).size.width,
                    child:Image.file(File(pictureFile!.path))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flash_off_rounded,
                      color: Color.fromRGBO(0, 0, 0, 0),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.flash_off_rounded,color: Colors.white,)),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.cancel_outlined,color: Colors.white,)),
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 200,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(FontAwesomeIcons.music,color: Colors.white,)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.timer,color: Colors.white,)),
                      IconButton(
                        onPressed: () {},
                        icon: Text(
                          "1x",
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_tilt_shift,color: Colors.white,)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.touch_app,color: Colors.white,)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.grid_view,color: Colors.white,)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,)),
                    ],
                  )),
              Positioned.fill(
                bottom: 70,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Container(
                        height: 60,
                        width: 60,
                      margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(
                                color: Colors.black,
                                width: 1,
                             ),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: IconButton(
                          onPressed: () async{
                            pictureFile= await cameraController!.takePicture();
                            setState(() {});
                          },
                         icon:Icon (Icons.slideshow,color: Colors.red,size: 30,))
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            overflow: Overflow.visible,
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  height: 40,
                                  width: 40,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              Positioned(
                                  bottom:-8,
                                  right: -7,
                                  child: Icon(
                                    Icons.add_circle_sharp,
                                    color: Colors.blue,
                                  ))
                            ]),
                        Text(
                          "REELS",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white,),
                        ),
                        IconButton(
                          onPressed: (){},
                          icon:Icon(Icons.flip_camera_ios,color: Colors.white,))
                      ],
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
