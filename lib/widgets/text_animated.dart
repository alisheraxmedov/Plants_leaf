import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_crops/consts/colors.dart';

class AnimatedText extends StatelessWidget {
  final String txt1;
  final String txt2;
  final String txt3;
  const AnimatedText({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.txt3,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.sizeOf(context).width;
    return DefaultTextStyle(
      style: GoogleFonts.rubikBurned(
        fontSize: fontSize * 0.16,
        color: ConstColor.white,
        fontWeight: FontWeight.bold,
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 1000),
        animatedTexts: [
          RotateAnimatedText(txt1),
          RotateAnimatedText(txt2),
          RotateAnimatedText(txt3),
        ],
      ),
    );
  }
}

class AnimatedText2 extends StatefulWidget {
  const AnimatedText2({super.key});

  @override
  State<AnimatedText2> createState() => _AnimatedText2State();
}

class _AnimatedText2State extends State<AnimatedText2> {
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  "Biz bilan",
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: const Duration(milliseconds: 50)
                ),
                ColorizeAnimatedText(
                  "Sog'lom Hosilga",
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: const Duration(milliseconds: 50)
                ),
                ColorizeAnimatedText(
                  "Ega Bo'ling",
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                  speed: const Duration(milliseconds: 50)
                ),
              ],
              isRepeatingAnimation: true,
            ),
          ],
        ),
      ),
    );
  }
}
