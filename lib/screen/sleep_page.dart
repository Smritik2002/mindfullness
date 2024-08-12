import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/audioplayers.dart';
import 'package:mindfullness/components/contain.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/video_player.dart';
import 'package:mindfullness/screen/yogapage.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  int _currentIndex = 0; // Default index updated to HomePage

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ArticlesPage()),
        );
        break;
    }
  }

  Widget _buildImageCard(String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for Netflix look
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Sleep',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyContainer(
                    texts: const ["All"],
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                  ),
                  MyContainer(
                    texts: const ["Sleep"],
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SleepPage())),
                  ),
                  MyContainer(
                    texts: const ["Meditation"],
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeditationPage())),
                  ),
                  MyContainer(
                    texts: const ["Yoga"],
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Yogapage())),
                  ),
                  MyContainer(
                    texts: const ["Articles"],
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArticlesPage())),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16.0),
              child: Text('Featured',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 220,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImageCard('images/calm2.jpeg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                  _buildImageCard('images/mind3.jpeg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                  _buildImageCard('images/mind5.jpeg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                  _buildImageCard('images/mind2.jpg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                  _buildImageCard('images/calm2.jpeg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                  _buildImageCard('images/calm1.jpeg', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoPlayer(
                                videoUrls: [], videoUrl: [])));
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16.0),
              child: Text('Playlist',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Audioplayers()));
                    },
                    child: const MyContain(
                        imagePath: 'images/calm1.jpeg',
                        text: 'Relaxing Mindfulness'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Audioplayers()));
                    },
                    child: const MyContain(
                        imagePath: 'images/mind2.jpg', text: 'Calm Morning'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Audioplayers()));
                    },
                    child: const MyContain(
                        imagePath: 'images/yoga2.jpeg',
                        text: 'Peaceful Moments'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Audioplayers()));
                    },
                    child: const MyContain(
                        imagePath: 'images/calm6.jpeg',
                        text: 'Peaceful Environment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
