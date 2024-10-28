import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tasktest/ui/widgets/custom_bar.dart';
import 'package:tasktest/ui/widgets/popular_chalenges_custom_container.dart';

import '../../cubit/cubit.dart';
import '../widgets/text_widget.dart';

class MainHome extends StatefulWidget {
  final double value; // Use Future instead of double directly

  MainHome({required this.value, super.key});

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {
  double currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 27, top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 100, left: 140, top: 15),
                          child: Text.rich(
                            TextSpan(
                              text: "GREEN.",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff2DC374),
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'MIND',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFD800),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SvgPicture.asset("assets/svg/notifications.svg"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 36,
                            right: 36,
                            child: Container(
                              width: 358,
                              height: 225,
                              decoration: BoxDecoration(
                                color: Color(0xffFFD800),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff2DC37452),
                                    blurRadius: 25,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(top: 14.0, left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0.0),
                                      child: Image.asset("assets/images/images-8.png"),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: "Hi, ", // First part of the text
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold), // First style
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Omar', // Second part of the text
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: 18), // Second style
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextWidget(
                                      text: "Total Score",
                                      size: 9,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(height: 5),
                                    TextWidget(
                                      text: widget.value.toString(),
                                      size: 39,
                                      color: Color(0xff139651),
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 65,
                            child: Stack(
                              children: [
                                Image.asset("assets/images/Path 64.png"),
                                Positioned(
                                  top: 6,
                                  left: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: "Rank",
                                        color: Colors.white,
                                        size: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      TextWidget(
                                        text: "A",
                                        color: Colors.white,
                                        size: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -23,
                            child: Container(
                              width: 430,
                              height: 183,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(231, 238, 240, 0.31)),
                            ),
                          ),
                          Positioned(
                            top: 140,
                            left: 36,
                            right: 36,
                            child: Container(
                              width: 358,
                              height: 84,
                              decoration: BoxDecoration(
                                color: Color(0xff2DC374),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff2DC37452), blurRadius: 25)
                                ],
                              ),
                              child:  BlocProvider(
                                create: (context) => ProgressCubit(),
                                child: CustomProgressBar(totalSteps: 8, targetStep: widget.value),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 55,
                              bottom: 145,
                              child: Image.asset("assets/images/boy.png")),
                          Positioned(
                              bottom: -5,
                              left: 30,
                              child: SvgPicture.asset("assets/svg/second_button.svg"))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: TextWidget(
                      text: "LATEST BADGES",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2DC374),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 36),
                        Image.asset("assets/images/genius.png"),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/onTime.png"),
                        const SizedBox(width: 10),
                        Stack(
                          children: [
                            Image.asset("assets/images/sport.png"),
                            const Positioned(
                                bottom: 15,
                                left: 16,
                                child: TextWidget(
                                  text: "SPORTAGE",
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/math.png")
                      ],
                    ),
                  ),
                  SizedBox(height: 21),
                  const Padding(
                    padding: EdgeInsets.only(left: 36.0),
                    child: TextWidget(
                      text: "POPULAR CHALENGES",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2DC374),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 36),
                        PopularChallengesCustomContainer(
                            containerColor: Color(0xff2DC374),
                            titleImage: "assets/images/COINTREE.png",
                            startImage: "assets/images/start.png",
                            mainImage:
                            "assets/images/tree.png"),
                        const SizedBox(width: 10),
                        PopularChallengesCustomContainer(
                            containerColor: Color(0xffFFD800),
                            titleImage: "assets/images/HappyFARM.png",
                            startImage: "assets/images/hfstart.png",
                            mainImage:
                            "assets/images/golf-course-with-golf-course-golf-club.png")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 358,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white ,
                              boxShadow: [
                                BoxShadow(color:Color.fromRGBO(45, 195, 116, 0.32),
                                    blurRadius: 25
                                )
                              ]
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 25,
                          child: Stack(children: [
                            SvgPicture.asset("assets/svg/Ellipse 19.svg"),
                            Positioned(
                                top: 12,
                                left: 14,
                                child: SvgPicture.asset("assets/svg/home.svg"))
                          ],),
                        ),
                        Positioned(
                            top: 15,
                            left: 120,
                            child: SvgPicture.asset("assets/svg/tennis.svg")),
                        Positioned(
                            top: 15,
                            right: 120,
                            child: SvgPicture.asset("assets/svg/badge.svg")),
                        Positioned(
                            top: 15,
                            right: 50,
                            child: SvgPicture.asset("assets/svg/user.svg")),

                      ],
                    ),
                  )
                ],),
            )
    ));
  }
}
