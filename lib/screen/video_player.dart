import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:mindfullness/screen/download_page.dart'; // Import the DownloadPage

class VideoPlayer extends StatefulWidget {
  const VideoPlayer(
      {super.key, required List videoUrls, required List videoUrl});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // List of video URLs or IDs
  final List<String> _videoUrls = [
    "https://youtu.be/eNUpTV9BGac",
    "https://youtu.be/K87aFjB7Ff0",
    "https://youtu.be/U-YLFFf4X0A",
    "https://youtu.be/rnTB1bueBvU",
    "https://youtu.be/o_kgdCGisso",
    "https://www.youtube.com/watch?v=2RTZNLL0wss&pp=ygUPeW9nYSBwbGF5bGlzdHMg",
  ];

  late YoutubePlayerController _controller;
  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    final videoId =
        YoutubePlayer.convertUrlToId(_videoUrls[_currentVideoIndex]);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void _changeVideo(int index) {
    setState(() {
      _currentVideoIndex = index;
      final videoId =
          YoutubePlayer.convertUrlToId(_videoUrls[_currentVideoIndex])!;
      _controller.load(videoId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getThumbnailUrl(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  void _navigateToDownloadPage(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DownloadPage(
            videoUrl: videoUrl), // Pass the video URL to the DownloadPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        children: [
          Expanded(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Ready'),
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                RemainingDuration(),
                const PlaybackSpeedButton(),
                FullScreenButton(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _videoUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  onTap: () => _changeVideo(index),
                  selected: index == _currentVideoIndex,
                  leading: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Circular border radius
                    child: SizedBox(
                      width: 100, // Fixed width for thumbnails
                      height: 100, // Fixed height for thumbnails
                      child: Image.network(
                        _getThumbnailUrl(_videoUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    'Video ${index + 1}',
                    style: TextStyle(
                      fontWeight: index == _currentVideoIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  // Adding the download icon to the trailing section
                  trailing: IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      // Navigate to DownloadPage with the selected video URL
                      _navigateToDownloadPage(context, _videoUrls[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
