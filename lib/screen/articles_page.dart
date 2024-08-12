import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfullness/components/container.dart';
import 'package:mindfullness/components/custom_bottomnavigationbar.dart';
import 'package:mindfullness/components/custom_drawer.dart';
import 'package:mindfullness/screen/articlesdetailspage.dart';
import 'package:mindfullness/screen/blog.dart';
import 'package:mindfullness/screen/home_page.dart';
import 'package:mindfullness/screen/meditation_page.dart';
import 'package:mindfullness/screen/sleep_page.dart';
import 'package:mindfullness/screen/yogapage.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  int _currentIndex = 0; // Default index

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Implement navigation logic based on index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SleepPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MeditationPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Yogapage()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ArticlesPage()),
        );
        break;
      default:
        break;
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'More Options',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: const Text('Blog'),
                onTap: () {
                  // Handle search action
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogPostFormPage(),
                      ));
                },
              ),
            ],
          ),
        );
      },
    );
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
        child: Column(
          children: [
            // Horizontal Row with MyContainer widgets
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
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Sleep"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SleepPage()),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Meditation"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeditationPage()),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Yoga"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Yogapage()),
                      );
                    },
                  ),
                  MyContainer(
                    texts: const ["Articles"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArticlesPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // List of GestureDetector widgets with image and text
            ...List.generate(
                5,
                (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailsPage()),
                        );
                      },
                      child: Container(
                        height: 110,
                        width: 360,
                        margin: const EdgeInsets.only(
                            bottom: 20), // Margin between items
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 14, 44, 77),
                          borderRadius: BorderRadius.circular(
                              10), // Border radius of the container
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                radius: 30, // Radius of the CircleAvatar
                                backgroundImage: AssetImage(
                                    "images/yoga4.jpeg"), // Your image path
                                backgroundColor: Colors
                                    .transparent, // Ensure the background is transparent
                              ),
                            ),
                            const SizedBox(
                                width:
                                    10.0), // Space between the CircleAvatar and text
                            Expanded(
                              child: Text(
                                'Smriti Kunwar', // Replace with your desired text
                                style: const TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 16, // Text size
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
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
      // Add a button to show the bottom sheet
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        child: const Icon(Icons.more_horiz),
        backgroundColor: const Color.fromARGB(255, 14, 44, 77),
      ),
    );
  }
}
