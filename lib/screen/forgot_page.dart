import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mindfullness/screen/verification_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "lottie/forgot.json",
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter Email Address',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerificationPage(),
                  ),
                );
              },
              child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Send',
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Define what happens when the "Back to login" button is pressed
              },
              child: Text(
                'Back to login',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
