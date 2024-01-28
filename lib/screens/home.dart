import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_crops/consts/colors.dart';
import 'package:healthy_crops/widgets/text.dart';

File? selectedImage;

class Home extends StatefulWidget {
  static const String routeName = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColor.darkColor,
        title: const TextWidget(
          data: "Welcome with App",
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/leaf2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            selectedImage != null
                ? SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox(
                    child: Text(
                      "Select Image!",
                      style: GoogleFonts.roboto(
                        fontSize: MediaQuery.sizeOf(context).width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: ConstColor.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
