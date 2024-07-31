import 'package:flutter/material.dart';

class Imagepaceholder extends StatelessWidget {
  final String? imagepath;

  const Imagepaceholder({super.key, this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagepath!,
      fit: BoxFit.cover,
    );
  }
}
