import 'package:flutter/material.dart';
import 'package:ui_challenges/movies_directory/components/my_card_with_desc.dart';
import 'package:ui_challenges/movies_directory/my_colors.dart';
import 'package:ui_challenges/movies_directory/my_textstyles.dart';

List<Map<String, dynamic>> _moviesList = [
  {
    'movieTitle': "Hitman's Wife's Bodyguard",
    'movieCategories': ['Action', 'Comedy', 'Crime'],
    'movieRating': "3.5",
    'movieDesc': "The worlds most lethal odd couple"
  },
  {
    'movieTitle': "Hitman's Wife's Bodyguard",
    'movieCategories': ['Action', 'Comedy', 'Crime'],
    'movieRating': "3.5",
    'movieDesc': "The worlds most lethal odd couple"
  },
  {
    'movieTitle': "Hitman's Wife's Bodyguard",
    'movieCategories': ['Action', 'Comedy', 'Crime'],
    'movieRating': "3.5",
    'movieDesc': "The worlds most lethal odd couple"
  },
];

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(height: 25, 'assets/movies_directory/back-icon.png'),
              ),
              const SizedBox(width: 20),
              Text(
                'Latest',
                style: MyTextStyles.largeTitle,
              ),
              Text(
                '.',
                style: MyTextStyles.largeDot,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // GridView

          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  primary: true, // scrollable : true
                  shrinkWrap: true,
                  itemCount: _moviesList.length,
                  itemBuilder: (context, index) {
                    String title = _moviesList[index]['movieTitle']!;
                    String rating = _moviesList[index]['movieRating']!;
                    String desc = _moviesList[index]['movieDesc']!;
                    List<String> cats = _moviesList[index]['movieCategories']!;
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyCardWithDesc(
                          movieCategories: cats,
                          movieDesc: desc,
                          movieRating: rating,
                          movieTitle: title,
                        ));
                  })),

          //
        ],
      )),
    );
  }
}
