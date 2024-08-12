import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:mindfullness/screen/video_player.dart';

class Yogapage extends StatefulWidget {
  const Yogapage({super.key});

  @override
  State<Yogapage> createState() => _YogapageState();
}

class _YogapageState extends State<Yogapage> {
  int _currentIndex = 0;

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
      // Handle navigation based on the index
      switch (index) {
        case 0:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          break;
        case 1:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SleepPage()));
          break;
        case 2:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MeditationPage()));
          break;
        case 3:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Yogapage()));
          break;
        case 4:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ArticlesPage()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yoga',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
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
      body: Container(
        color: Colors.black, // Set the body background color to black
        child: Column(
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
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Sleep"],
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SleepPage(),
                        ),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Meditation"],
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MeditationPage(),
                        ),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Yoga"],
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Yogapage(),
                        ),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Articles"],
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ArticlesPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Featured',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set the text color to white
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFeaturedCard('images/yoga1.jpeg'),
                    const SizedBox(height: 8),
                    _buildFeaturedCard('images/yoga3.jpeg'),
                    const SizedBox(height: 8),
                    _buildFeaturedCard('images/yoga5.jpeg'),
                    const SizedBox(height: 8),
                    _buildFeaturedCard('images/yoga2.jpeg'),
                    const SizedBox(height: 8),
                    _buildFeaturedCard('images/yoga4.jpeg'),
                    const SizedBox(height: 8),
                    _buildFeaturedCard('images/calm1.jpeg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildFeaturedCard(String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VideoPlayer(
              videoUrls: [],
              videoUrl: [],
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 360,
            height: 200,
          ),
        ),
      ),
    );
  }
}
