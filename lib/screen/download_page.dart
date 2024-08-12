import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key, required String videoUrl});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool _isDownloading = false;
  String _statusMessage = '';
  late VideoPlayerController _videoController;
  File? _downloadedVideoFile;

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      // Permission denied
      setState(() {
        _statusMessage = 'Storage permission denied';
      });
    }
  }

  Future<void> _downloadFile(String url, String fileName) async {
    try {
      await _requestPermissions();

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        if (fileName.endsWith('.mp4')) {
          _downloadedVideoFile = file;
          _initializeVideoPlayer(filePath);
        }

        setState(() {
          _isDownloading = false;
          _statusMessage = 'File downloaded to $filePath';
        });
      } else {
        setState(() {
          _isDownloading = false;
          _statusMessage = 'Failed to download file';
        });
      }
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _statusMessage = 'Error downloading file: $e';
      });
    }
  }

  void _initializeVideoPlayer(String filePath) {
    _videoController = VideoPlayerController.file(File(filePath))
      ..initialize().then((_) {
        setState(() {}); // Ensure the video player is updated
        _videoController.play();
      });
  }

  void _startDownload() {
    setState(() {
      _isDownloading = true;
      _statusMessage = 'Downloading files...';
    });

    const videoUrl =
        'https://www.youtube.com/watch?v=79kpoGF8KWU&pp=ygUOY2FsbW5lc3MgdmlkZW8%3D';

    _downloadFile(videoUrl, 'downloaded_video.mp4');
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Download',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _isDownloading ? null : _startDownload,
              child: const Text('Download '),
            ),
            if (_isDownloading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            if (_statusMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _statusMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            if (_downloadedVideoFile != null &&
                _videoController.value.isInitialized)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton:
          _downloadedVideoFile != null && _videoController.value.isInitialized
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      } else {
                        _videoController.play();
                      }
                    });
                  },
                  child: Icon(
                    _videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                )
              : null,
    );
  }
}
