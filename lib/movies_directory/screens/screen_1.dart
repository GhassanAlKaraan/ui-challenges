import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/components/my_card.dart';
import 'package:ui_challenges/movies_directory/my_colors.dart';
import 'package:ui_challenges/movies_directory/my_textstyles.dart';
import 'package:ui_challenges/movies_directory/screens/screen_2.dart';

List<Map<String, String>> _moviesList = [
  {'movieTitle': "Hitman's Wife's Bodyguard", 'movieRating': "3.5"},
  {'movieTitle': "Hitman's Wife's Bodyguard", 'movieRating': "3.5"},
  {'movieTitle': "Hitman's Wife's Bodyguard", 'movieRating': "3.5"},
  {'movieTitle': "Hitman's Wife's Bodyguard", 'movieRating': "3.5"},
  {'movieTitle': "Hitman's Wife's Bodyguard", 'movieRating': "3.5"},
];

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Image.asset(height: 25, 'assets/movies_directory/back-icon.png'),
              const SizedBox(width: 20),
              Text(
                'Discover',
                style: MyTextStyles.largeTitle,
              ),
              Text(
                '.',
                style: MyTextStyles.largeDot,
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Screen2()));
                  },
                  icon: Icon(
                    Icons.arrow_circle_right,
                    size: 40,
                    color: MyColors.secondary,
                  )),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 30),

          // GridView

          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  primary: true, // scrollable : true
                  shrinkWrap: true,
                  itemCount: _moviesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                  ),
                  itemBuilder: (context, index) {
                    String title = _moviesList[index]['movieTitle']!;
                    String rating = _moviesList[index]['movieRating']!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyCard(movieTitle: title, movieRating: rating),
                    );
                  })),

          //
        ],
      )),
    );
  }
}
