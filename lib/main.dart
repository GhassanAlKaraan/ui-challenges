import 'package:flutter/material.dart';
import 'package:ui_challenges/car_rental/car_rental_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarRentalPage()
    );
  }
}
