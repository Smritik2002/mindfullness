import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/components/custon_bottomnavigationbar.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/sleep_page.dart'; // Assuming you have a SleepPage

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  int _currentIndex = 1; // Initialize to default index for Meditation

  final List<String> imageAssets = [
    'images/calm1.jpeg',
    'images/calm2.jpeg',
    'images/calm3.webp',
    'images/calm4.jpeg',
    'images/calm5.jpg',
    'images/calm6.jpeg',
    'images/calm7.jpeg',
    'images/mind1.jpeg',
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
    if (_currentIndex == index)
      return; // Do nothing if the same index is tapped

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
        // No need to push another MeditationPage
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ArticlesPage()),
        );
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
                    // No need to push another MeditationPage
                    print('Meditation category tapped');
                  },
                ),
                MyContainer(
                  texts: const ["Articles"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArticlesPage()));
                    print('Articles category tapped');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 5), // Add some spacing between rows
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 2.0, // Horizontal spacing
                mainAxisSpacing: 2.0, // Vertical spacing
              ),
              itemCount: imageAssets.length, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Padding around each item
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8.0), // Apply border radius
                      image: DecorationImage(
                        image: AssetImage(imageAssets[index]),
                        fit: BoxFit.cover, // Ensure image covers the container
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          imageTexts[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
      ),
    );
  }
}
