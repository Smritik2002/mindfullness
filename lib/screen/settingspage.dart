import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // ignore: unused_field
  final bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // ListTile(
          //   title: Text(
          //     'Notifications',
          //     style: GoogleFonts.poppins(fontSize: 18),
          //   ),
          //   leading: const Icon(Icons.notifications),
          //   trailing: Switch(
          //     value: _notificationsEnabled,
          //     onChanged: (value) {
          //       setState(() {
          //         _notificationsEnabled = value;
          //       });
          //     },
          //   ),
          // ),
          ListTile(
            title: Text(
              'Dark Mode',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            leading: const Icon(Icons.dark_mode),
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Language',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: <String>['English', 'Nepali'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
