import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_crops/consts/colors.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final FontWeight fontWeight;
  final Color color;
  const TextWidget({
    super.key,
    required this.data,
    this.fontWeight = FontWeight.normal,
    this.color = ConstColor.white,
  }
  
  );

  @override
  Widget build(BuildContext context) {
    double fonstSize = MediaQuery.sizeOf(context).width;
    return Text(
      data,
      style: GoogleFonts.roboto(
        fontSize: fonstSize * 0.09,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
