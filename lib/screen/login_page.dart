import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
              height: 50,
              width: 20,
            ),
            Column(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('Forgot Password ? ')],
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
                      backgroundColor: const Color.fromARGB(255, 161, 209, 249),
                      minimumSize: const Size(20, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ))
              ],
            ),
          ]),
        ));
  }
}
