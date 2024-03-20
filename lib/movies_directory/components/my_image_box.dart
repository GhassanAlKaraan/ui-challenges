import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/my_colors.dart';

class MyImageBox extends StatelessWidget {
  const MyImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 273,
        width: 182,
        decoration: BoxDecoration(
          color: MyColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      Positioned(
          right: 15,
          top: 15,
          child: Image.asset('assets/movies_directory/bookmark-icon-default.png')),
    ]);
  }
}
