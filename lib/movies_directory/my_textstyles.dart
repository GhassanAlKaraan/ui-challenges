import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/my_colors.dart';

class MyTextStyles {
  static TextStyle categoryText = TextStyle(
      color: MyColors.primaryText, fontFamily: "Poppins", fontSize: 14);

  static TextStyle descText = TextStyle(
      color: MyColors.secondaryText, fontFamily: "Poppins", fontSize: 13);

  static TextStyle title1 = TextStyle(
      color: MyColors.primaryText,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 20);

  static TextStyle title2 = TextStyle(
      color: MyColors.primaryText,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 20);

  static TextStyle largeTitle = TextStyle(
      color: MyColors.primaryText,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 30);
  static TextStyle largeDot = TextStyle(
      color: MyColors.secondary,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 30);

  static TextStyle rating1 = TextStyle(
      color: MyColors.primaryText, fontFamily: "Poppins", fontSize: 22);

  static TextStyle rating2 = TextStyle(
      color: MyColors.primaryText, fontFamily: "Poppins", fontSize: 18);
}
