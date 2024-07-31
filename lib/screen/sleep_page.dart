import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/components/custon_bottomnavigationbar.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/articles_page.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  int _currentIndex = 3; // Set default index for SleepPage

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
      case 3:
        // No need to navigate to SleepPage
        break;
    }
  }

  Widget _buildImageCard(String imagePath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
        title: Text(
          'Sleep',
          style: GoogleFonts.poppins(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
                MyContainer(
                  texts: const ["Sleep"],
                  onTap: () {
                    // No need to push another SleepPage
                    print('Sleep category tapped');
                  },
                ),
                MyContainer(
                  texts: const ["Meditation"],
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeditationPage()));
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
          Text(
            'Featured',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 200,
            width: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildImageCard('images/mind1.jpeg'),
                _buildImageCard('images/mind3.jpeg'),
                _buildImageCard('images/mind5.jpeg'),
                _buildImageCard('images/mind2.jpg'),
                _buildImageCard('images/calm2.jpeg'),
                _buildImageCard('images/calm1.jpeg'),
              ],
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
