import 'package:flutter/material.dart';
import 'package:healthy_crops/consts/colors.dart';

class Wait extends StatelessWidget {
  static const String routeName = "/wait";
  const Wait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.lightGreen,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60.0,
              color: ConstColor.white,
            ),
            SizedBox(height: 25.0),
            Text(
              "Please check your connection!",
              style: TextStyle(
                fontFamily: 'RoadRage',
                fontSize: 35.0,
                color: ConstColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}