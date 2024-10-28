import 'package:flutter/material.dart';

class PopularChallengesCustomContainer extends StatelessWidget {
  const PopularChallengesCustomContainer({super.key,
    required this.containerColor,
    required this.titleImage,
    required this.startImage ,
    required this.mainImage
  });
        final Color containerColor;
        final String titleImage ;
        final String startImage;
        final String mainImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 238,
      height: 115,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(titleImage),
              Image.asset(startImage)
            ],
          ),
          Image.asset(mainImage)
        ],
      ),
    );
  }
}
