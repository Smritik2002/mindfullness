import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sliders = [
    "images/calm1.png",
    "images/calm2.png",
    "images/calm3.png",
    "images/calm4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 168, 243),
          centerTitle: true,
          title: Text(
            'Mindfulness',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 252, 249, 249), fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                child: Image.asset(
                  "images/person1.png",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(sliders[0]), fit: BoxFit.cover),
                  ),
                )
              ],
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
            )
          ],
        ));
  }
}
