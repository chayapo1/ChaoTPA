import 'package:chao_tpa/models/listvideomodel.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final ListVideoModel listVideoModel;
  VideoPlayer({Key key, this.listVideoModel}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // Explicit
  ListVideoModel listVideoModel;
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  String urlVideo;

  // Method
  @override
  void initState() {
    super.initState();
    setState(() {
      listVideoModel = widget.listVideoModel;
      urlVideo = listVideoModel.videoPath;
      videoPlayerController = VideoPlayerController.network(urlVideo);
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: false,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Name: ${listVideoModel.name}'),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
