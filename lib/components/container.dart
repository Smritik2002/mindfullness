import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final List<String> texts;
  final VoidCallback onTap;

  const MyContainer({super.key, required this.texts, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
          8), // Add this to match the Container's borderRadius
      child: Container(
        height: 50,
        width: 100,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 14, 44, 77),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: texts
              .map((text) => Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
