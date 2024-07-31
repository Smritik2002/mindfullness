import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:mindfullness/components/custon_bottomnavigationbar.dart'; // Ensure this import is added

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ArticlesPage> {
  int _currentIndex = 2; // Set default index for ArticlesPage

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MeditationPage()),
        );
        break;
      case 2:
        // No need to navigate to ArticlesPage
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SleepPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Articles',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MyContainer(
              texts: const ["All"],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            MyContainer(
              texts: const ["Sleep"],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SleepPage()));
              },
            ),
            MyContainer(
              texts: const ["Meditation"],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MeditationPage()));
                print('Meditation category tapped');
              },
            ),
            MyContainer(
              texts: const ["Articles"],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArticlesPage()));
                print('Articles category tapped');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
      ),
    );
  }
}
