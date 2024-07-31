import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  // Sample data for downloads
  final List<DownloadItem> _downloadItems = [
    DownloadItem('Image.jpg', 100, 'Completed'),
    DownloadItem('Video.mp4', 20, 'In Progress'),
    DownloadItem('Music.mp3', 75, 'Completed'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Downloads',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        children: _downloadItems.map((item) {
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            title: Text(
              item.fileName,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item.status,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            trailing: SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  LinearProgressIndicator(
                    value: item.progress / 100,
                    backgroundColor: Colors.grey.shade300,
                    color:
                        item.status == 'Completed' ? Colors.green : Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${item.progress}%',
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Define action for tap, e.g., show details
            },
          );
        }).toList(),
      ),
    );
  }
}

class DownloadItem {
  final String fileName;
  final int progress; // In percentage
  final String status;

  DownloadItem(this.fileName, this.progress, this.status);
}
