import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mindfullness/screen/forgot_page.dart';
import 'package:mindfullness/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 248, 249),
        body: SingleChildScrollView(
          child: Column(children: [
            LottieBuilder.asset(
              "lottie/login.json",
              height: 200,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email or Phone number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 15, 132, 227),
                        minimumSize: const Size(20, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Login',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal))),
                ],
              ),
            ),
          ]),
        ));
  }
}
