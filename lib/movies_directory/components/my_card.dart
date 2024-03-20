import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/components/my_image_box.dart';
import 'package:ui_challenges/movies_directory/my_textstyles.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.movieTitle, required this.movieRating});

  final String movieTitle;
  final String movieRating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyImageBox(),
          const SizedBox(height: 10),
          SizedBox(
            width: 182,
            child: Column(
              children: [
                Text(
                  movieTitle,
                  style: MyTextStyles.title2,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(movieRating, style: MyTextStyles.rating1),
                    const SizedBox(width: 5),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
 
  }
}