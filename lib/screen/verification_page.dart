import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mindfullness/screen/newpassword_page.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "lottie/verification.json",
            ),
            Text(
              'Enter Verification Code',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return const SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPassword(),
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
              onPressed: () {},
              child: Text(
                'Resend',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
