import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:mindfullness/components/audioplayers.dart';
import 'package:mindfullness/screen/yogapage.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  int _currentIndex = 2; // Default to Meditation Page

  final List<String> imageAssets = [
    'images/calm1.jpeg',
    'images/calm2.jpeg',
    'images/calm3.webp',
    'images/calm4.jpeg',
    'images/calm5.jpg',
    'images/calm6.jpeg',
    'images/calm7.jpeg',
    'images/yoga1.jpeg',
    'images/calm8.jpeg',
    'images/mind2.jpg',
    'images/mind3.jpeg',
    'images/mind5.jpeg',
  ];

  final List<String> imageTexts = [
    'CalmSpace',
    'PeacePath',
    'InnerCalm',
    'BreatheEase',
    'CalmHeaven',
    'MindfulGlow',
    'CalmAura',
    'InnerEase',
    'ZenFlow',
    'CalmReflection',
    'CalmInsight',
    'PeacefulHarmony',
  ];

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SleepPage()));
        break;
      case 2:
        // Stay on Meditation Page
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Yogapage()));
        break;
      case 4:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ArticlesPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Meditation',
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyContainer(
                  texts: const ["All"],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
                MyContainer(
                  texts: const ["Sleep"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SleepPage()));
                  },
                ),
                MyContainer(
                  texts: const ["Meditation"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeditationPage()));
                  },
                ),
                MyContainer(
                  texts: const ["Yoga"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Yogapage()));
                  },
                ),
                MyContainer(
                  texts: const ["Articles"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArticlesPage()));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Horizontal spacing
                mainAxisSpacing: 8.0, // Vertical spacing
                childAspectRatio: 1.5, // Aspect ratio of each item
              ),
              itemCount: imageAssets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Audioplayers(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(imageAssets[index]),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                        ),
                        child: Text(
                          imageTexts[index],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey[300],
      ),
    );
  }
}
