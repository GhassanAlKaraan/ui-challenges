import 'package:flutter/material.dart';

class CardHolderTextField extends StatelessWidget {
  const CardHolderTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.orange, fontSize: 16),
        focusColor: Colors.orange,
        fillColor: Colors.orange,
        // border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
        labelText: hint,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        // hintText: hint,
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}