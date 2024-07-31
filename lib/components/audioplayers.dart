import 'package:flutter/material.dart';

class Audioplayers extends StatefulWidget {
  const Audioplayers({super.key});

  @override
  State<Audioplayers> createState() => _AudioplayersState();
}

class _AudioplayersState extends State<Audioplayers> {
  final player = const Audioplayers();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('sk'),
    );
  }
}
