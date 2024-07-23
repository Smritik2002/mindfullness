import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer extends StatelessWidget {
  final String container;
  const MyContainer({
    super.key,
    required this.container,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                container, // Use the passed parameter
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Added color for better contrast
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
