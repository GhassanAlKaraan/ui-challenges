import 'package:flutter/services.dart';

bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
}

TextInputFormatter createNumberFilter() {
  return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
}