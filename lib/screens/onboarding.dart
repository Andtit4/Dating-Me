import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnBoarding(),
  ));
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //Controller

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late double screenWidth = MediaQuery.of(context).size.width;
    late double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * .1),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset(
                'assets/img/date.json',
              ),
              /*  Lottie.network(
                  "https://assets5.lottiefiles.com/packages/lf20_SLZG2B.json"), */
              const Spacer(),
              AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                TyperAnimatedText('Dating Me.',
                    speed: const Duration(milliseconds: 150),
                    textStyle: const TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 233, 19, 90),
                        fontFamily: 'caramel',
                        fontWeight: FontWeight.bold))
              ]),
              const Spacer(),
              AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                ColorizeAnimatedText('© AndTit',
                    speed: const Duration(microseconds: 150),
                    textStyle: const TextStyle(fontFamily: 'poppins', fontSize: 16),
                    colors: [Colors.pink, Colors.orange]),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
