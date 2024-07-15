import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ChinesePhrase extends StatelessWidget {
  const ChinesePhrase({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.pink[50],
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[100],
          title: const Text('P H R A S E S'),
          titleSpacing: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        body:  VideoGrid(),
      ),
    );
  }
}

class VideoGrid extends StatelessWidget {
  final List<VideoInfo> videos = [
    VideoInfo(
      videoUrl: 'https://www.youtube.com/watch?v=RPTB2W6JTsw',
      name: 'Basic Phrases Part 1',


    ),
    VideoInfo(
      videoUrl: 'https://www.youtube.com/watch?v=6zpquqzW6H0',
      name: 'Basic Phrases Part 2',

    ),
    VideoInfo(
      videoUrl: 'https://www.youtube.com/watch?v=IkTivf6N5HY',
      name: 'Basic Phrases Part 3',

    ),

    // Add more video URLs and info
  ];

  VideoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: videos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.5, // Adjust this value to make the video bigger
      ),


      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VideoWidget(
                  videoInfo: videos[index],
                ),
              ),

              const SizedBox(height: 15),
              Text(videos[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize:25)
              ),

            ],
          ),
        );
      },
    );
  }
}

class VideoInfo {
  final String videoUrl;
  final String name;


  VideoInfo({
    required this.videoUrl,
    required this.name,

  });
}

class VideoWidget extends StatefulWidget {
  final VideoInfo videoInfo;

  const VideoWidget({ required this.videoInfo, Key? key});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoInfo.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.pink,
      progressColors: const ProgressBarColors(
        playedColor: Colors.pink,
        handleColor: Colors.pink,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}