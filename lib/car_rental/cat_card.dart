import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        height: 100,
        width: 80,
        child: Center(child: Icon(icon, size: 30, color: Colors.grey[700],)),
      ),
    );
  }
}