import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          ' Notifications',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        children: [
          // Download Notification 1
          ListTile(
            leading: const Icon(Icons.download, color: Colors.green),
            title: Text(
              'Download Completed',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Video.mp3 has been successfully downloaded.',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            trailing: Text(
              '5 min ago',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ),
          // Download Notification 2
          ListTile(
            leading: const Icon(Icons.download, color: Colors.orange),
            title: Text(
              'Download Failed',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Failed to download "Image.jpg". Please try again later.',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            trailing: Text(
              '15 min ago',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ),
          // Download Notification 3
          ListTile(
            leading: const Icon(Icons.download, color: Colors.blue),
            title: Text(
              'Download In Progress',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Your file "Video.mp4" is currently downloading.',
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            trailing: Text(
              '30 min ago',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ),
          // Add more download notifications here as needed
        ],
      ),
    );
  }
}
