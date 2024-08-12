import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Initialize the awesome_notifications plugin
  AwesomeNotifications().initialize(
    // Set the default icon for notifications (null uses the app icon)
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.teal,
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notifications Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    // Check if notifications are allowed
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // Request permission if not allowed
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  // Method to create and display a notification
  void _createNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 123, // Unique ID for the notification
        channelKey: 'basic_channel',
        title: 'Download Completed',
        body: 'Your file "Video.mp3" has been downloaded successfully.',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Notifications',
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
          // Example Notification 1
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
          // Example Notification 2
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
          // Example Notification 3
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
        ],
      ),
      // Floating action button to trigger a notification
      floatingActionButton: FloatingActionButton(
        onPressed: _createNotification,
        child: const Icon(Icons.notification_important),
      ),
    );
  }
}
