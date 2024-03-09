import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final Color bgColor =
      Color(int.parse("#2A2575".substring(1, 7), radix: 16) + 0xFF000000);
  final Color purple2 =
      Color(int.parse("#A16BC4".substring(1, 7), radix: 16) + 0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset('assets/online_course/circle.png')),
                    Positioned(
                        child: Image.asset('assets/online_course/amico.png')),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Stud',
                            style: TextStyle(
                                fontSize: 80,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'ee',
                          style: TextStyle(
                              fontSize: 80,
                              color: purple2,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Learn easy and fast with Studee',
                      style: TextStyle(color: Colors.white),
                    ),
                    const Text('Watch video learning anytime',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Sign In ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(71, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
