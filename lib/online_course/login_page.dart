import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            //!
            Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Hello,',
                              style: TextStyle(fontSize: 18),
                            ),
                            const Text(
                              'Welcome Back',
                              style: TextStyle(
                                  fontSize: 34, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              obscureText: false,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Set border color to transparent
                                    width: 0,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  // Needed to handle the enabled state
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Set border color to transparent
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  // Needed to handle the focused state
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Keep border transparent even when the field is focused
                                    width: 0,
                                  ),
                                ),
                                hintText: 'Username',
                                hintStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                                fillColor: Colors.blueGrey[50],
                                filled:
                                    true, // Don't forget to set filled to true
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Set border color to transparent
                                    width: 0,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  // Needed to handle the enabled state
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Set border color to transparent
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  // Needed to handle the focused state
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .transparent, // Keep border transparent even when the field is focused
                                    width: 0,
                                  ),

                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                                fillColor: Colors.blueGrey[50],
                                filled: true,
                                
                              ),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: bgColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
