import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindfullness/components/audioplayers.dart';
import 'package:mindfullness/components/contain.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/profilepage.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('HomePage');

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _carouselIndex = 0;

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onCarouselChanged(int index) {
    setState(() {
      _carouselIndex = index;
    });
  }

  void _onSleepTap() {
    _logger.info('Sleep category tapped');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SleepPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'Mindfulness',
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 254, 254, 254),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Profilepage()));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("images/person1.png"),
              ),
            ),
          ),
        ],
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
                    onTap: () {
                      _logger.info('All category tapped');
                    },
                  ),
                  MyContainer(
                      texts: const ["Sleep"],
                      onTap: () {
                        _logger.info('Navigating to SleepPage');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SleepPage()));
                      }),
                  MyContainer(
                    texts: const ["Meditation"],
                    onTap: () {
                      _logger.info('Meditation category tapped');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MeditationPage()));
                    },
                  ),
                  MyContainer(
                    texts: const ["Articles"],
                    onTap: () {
                      _logger.info('Articles category tapped');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArticlesPage()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: CarouselSlider(
                items: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/calm5.jpg',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/calm6.jpeg',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/calm7.jpeg',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/calm8.jpeg',
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    _onCarouselChanged(index);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recently Played',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ));
                      },
                      child: _buildImageCard('images/mind1.jpeg')),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ));
                      },
                      child: _buildImageCard('images/mind3.jpeg')),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ));
                      },
                      child: _buildImageCard('images/mind5.jpeg')),
                  const SizedBox(width: 15),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ));
                      },
                      child: _buildImageCard('images/mind2.jpg')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recommend For You',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ),
                          );
                        },
                        child: const MyContain(
                          imagePath: 'images/mind3.jpeg',
                          text: 'Relaxing Mindfulness',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ),
                          );
                        },
                        child: const MyContain(
                          imagePath: 'images/calm5.jpg',
                          text: 'Calm Morning',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ),
                          );
                        },
                        child: const MyContain(
                          imagePath: 'images/mind1.jpeg',
                          text: 'Peaceful Moments',
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Audioplayers(),
                            ),
                          );
                        },
                        child: const MyContain(
                          imagePath: 'images/calm6.jpeg',
                          text: 'Peaceful Environment',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  Widget _buildImageCard(String imagePath) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
