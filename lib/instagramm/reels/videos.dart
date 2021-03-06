import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String src;
  const VideoScreen({Key? key,required this.src}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  bool selectedLike = true;
  bool centreLike=false;


  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    videoPlayerController = VideoPlayerController.network(widget.src);
    await Future.wait([videoPlayerController.initialize()]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        chewieController != null &&
            chewieController!
                .videoPlayerController.value.isInitialized
            ? Chewie(controller: chewieController!)
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Loading...')
          ],
        ),
        // Image.asset(
        //   'assets/images/anime.jpeg',
        //   fit: BoxFit.cover,
        // ),
        Positioned(
          bottom: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          size: 20,
                        ),
                      ),
                      radius: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "shilpa_tyagi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      (Icons.verified),
                      size: 18,
                      color: Colors.blue,
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin:
                  EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Enjoy these reels..... ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          "original audio - new track",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 15,
          bottom: 60,
          child: Column(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Text(
                "600k",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                FontAwesomeIcons.comment,
                color: Colors.white,
              ),
              Text(
                "200",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.near_me_outlined,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              )
            ],
          ),
        )
      ],
    );
  }
}
