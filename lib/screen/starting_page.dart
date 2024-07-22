import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindfullness/screen/login_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _HomePageState();
}

class _HomePageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 44, 77),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'MIND FULLNESS',
              style: TextStyle(
                  fontSize: 32,
                  color: Color.fromARGB(255, 250, 249, 248),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            LottieBuilder.asset(
              "lottie/animation.json",
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 107, 183, 245),
                  minimumSize: const Size(20, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
