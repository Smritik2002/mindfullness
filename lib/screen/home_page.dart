import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mindfullness/components/audioplayers.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/screen/articles_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/profilepage.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:logging/logging.dart';
import 'package:mindfullness/screen/yogapage.dart';

final Logger _logger = Logger('HomePage');

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                _navigateToPage(const Profilepage());
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
            _buildHorizontalScrollView(),
            _buildCarousel(),
            _buildSectionTitle('Recently Played'),
            _buildHorizontalImageList(),
            _buildSectionTitle('Recommended For You'),
            _buildRecommendedGrid(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  Widget _buildHorizontalScrollView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Row(
          children: [
            MyContainer(
              texts: const ["All"],
              onTap: () => _logger.info('All category tapped'),
            ),
            const SizedBox(width: 8),
            MyContainer(
              texts: const ["Sleep"],
              onTap: () => _navigateToPage(const SleepPage()),
            ),
            const SizedBox(width: 8),
            MyContainer(
              texts: const ["Meditation"],
              onTap: () => _navigateToPage(const MeditationPage()),
            ),
            const SizedBox(width: 8),
            MyContainer(
              texts: const ["Yoga"],
              onTap: () => _navigateToPage(const Yogapage()),
            ),
            const SizedBox(width: 8),
            MyContainer(
              texts: const ["Articles"],
              onTap: () => _navigateToPage(const ArticlesPage()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
        items: [
          _buildImageCard('images/calm5.jpg'),
          _buildImageCard('images/calm6.jpeg'),
          _buildImageCard('images/calm7.jpeg'),
          _buildImageCard('images/calm8.jpeg'),
          _buildImageCard('images/calm1.jpeg'),
          _buildImageCard('images/calm2.jpeg'), // New Image
          _buildImageCard('images/calm3.webp'), // New Image
        ],
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildHorizontalImageList() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildHorizontalImageCard('images/yoga2.jpeg'),
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/mind3.jpeg'),
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/mind5.jpeg'),
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/mind3.jpeg'),
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/mind6.jpeg'),
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/mind7.jpeg'), // New Image
          const SizedBox(width: 10),
          _buildHorizontalImageCard('images/yoga4.jpg'), // New Image
        ],
      ),
    );
  }

  Widget _buildHorizontalImageCard(String imagePath) {
    return GestureDetector(
      onTap: () => _navigateToPage(const Audioplayers()),
      child: SizedBox(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildGridItem('images/mind3.jpeg', 'Relaxing Mindfulness'),
          _buildGridItem('images/calm5.jpg', 'Calm Morning'),
          _buildGridItem('images/yoga1.jpeg', 'Peaceful Moments'),
          _buildGridItem('images/calm6.jpeg', 'Peaceful Environment'),
          _buildGridItem('images/mind2.jpg', 'Tranquil Vibes'),
          _buildGridItem('images/yoga3.jpeg', 'Morning Yoga'),
          _buildGridItem('images/calm1.jpeg', 'Evening Peace'), // New Image
          _buildGridItem('images/mind5.jpeg', 'Mindful Journey'), // New Image
        ],
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String text) {
    return GestureDetector(
      onTap: () => _navigateToPage(const Audioplayers()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8), // Space between image and text
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
