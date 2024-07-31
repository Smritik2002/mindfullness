import 'package:flutter/material.dart';

class MyContain extends StatelessWidget {
  final String imagePath;
  final String text;

  const MyContain({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Increased height to accommodate both image and text
      width: 352,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 44, 77),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8), // Space between image and text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                    Colors.white, // Ensure text is visible on dark background
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
