import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 44, 77),
      body: SafeArea(
        child: Column(
          children: [
            Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
