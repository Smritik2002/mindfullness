import 'package:flutter/material.dart';

class MyContain extends StatefulWidget {
  final String imagePath; // Add imagePath parameter
  // Add text parameter

  const MyContain({
    super.key,
    required this.imagePath,
    required String title,
  }); // Require imagePath and text in constructor

  @override
  State<MyContain> createState() => _MyContainState();
}

class _MyContainState extends State<MyContain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 100, // Increased height to accommodate both image and text
        width: 352,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 14, 44, 77),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
