import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/components/s_my_image_box.dart';
import 'package:ui_challenges/movies_directory/my_textstyles.dart';

class MyCardWithDesc extends StatelessWidget {
  const MyCardWithDesc(
      {super.key,
      required this.movieTitle,
      required this.movieRating,
      required this.movieDesc,
      required this.movieCategories});

  final String movieTitle;
  final String movieRating;
  final List<String> movieCategories;
  final String movieDesc;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Row(
        children: [
          const MySmallImageBox(),
          const SizedBox(width: 15),
          SizedBox(
            width: 163,
            height: 253,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTitle,
                  style: MyTextStyles.title1,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(movieRating, style: MyTextStyles.rating1),
                    const SizedBox(width: 10),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png'),
                    const SizedBox(width: 5),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png'),
                    const SizedBox(width: 5),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png'),
                    const SizedBox(width: 5),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png'),
                    const SizedBox(width: 5),
                    Image.asset(height: 20, 'assets/movies_directory/full-star.png')
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  movieCategories.join(', '),
                  textAlign: TextAlign.left,
                  style: MyTextStyles.categoryText,
                ),
                const SizedBox(height: 10),
                Text(
                  movieDesc,
                  style: MyTextStyles.descText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
