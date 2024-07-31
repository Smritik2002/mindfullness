import 'package:flutter/material.dart';

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
      onTap: onTap,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}
