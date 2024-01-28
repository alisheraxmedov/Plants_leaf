import 'package:flutter/material.dart';
import 'package:healthy_crops/screens/connectivity.dart';
import 'package:healthy_crops/widgets/text_animated.dart';

class Welcome extends StatefulWidget {
  static const String routeName = "/";
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ConnectivityCheck()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/leaf3.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: const Center(
          child: AnimatedText2(),
          // AnimatedText(txt1: "Welcome", txt2: "Healthy", txt3: "Crops"),

        ),
      ),
    );
  }
}


/*
{
  "kasallik_nomi":"ajdjaa",
  "ehtimollik":"str",
  "maslahat":"adhahdhha",
  "youurl":"url"
}
*/