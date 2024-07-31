import 'package:flutter/material.dart';
import 'package:mindfullness/screen/notification_page.dart';
import 'package:mindfullness/screen/search_page.dart';
import 'package:mindfullness/screen/download_page.dart'; // Import the DownloadPage

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_add),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Download',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          // Custom behavior for the "Search" item
          _handleSearchTap(context);
        } else if (index == 2) {
          // Custom behavior for the "Notifications" item
          _handleNotificationsTap(context);
        } else if (index == 3) {
          // Custom behavior for the "Download" item
          _handleDownloadTap(context);
        } else {
          // Handle other taps
          onTap(index);
        }
      },
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }

  void _handleSearchTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  void _handleNotificationsTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationsPage()),
    );
  }

  void _handleDownloadTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DownloadPage()),
    );
  }
}
