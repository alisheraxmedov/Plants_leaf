import 'package:flutter/material.dart';
import 'package:healthy_crops/consts/colors.dart';
import 'package:healthy_crops/screens/connectivity.dart';
import 'package:healthy_crops/screens/home.dart';
import 'package:healthy_crops/screens/information.dart';
import 'package:healthy_crops/screens/loading.dart';
import 'package:healthy_crops/screens/upload.dart';
import 'package:healthy_crops/screens/welcome.dart';
import 'package:healthy_crops/service/no_internet.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Home.routeName:
      return MaterialPageRoute(builder: (contex) => const Home());
    case Information.routeName:
      return MaterialPageRoute(builder: (contex) => const Information());
    case Upload.routeName:
      return MaterialPageRoute(builder: (contex) => const Upload());
    case Welcome.routeName:
      return MaterialPageRoute(builder: (contex) => const Welcome());
    case ConnectivityCheck.routeName:
      return MaterialPageRoute(builder: (contex) => const ConnectivityCheck());
    case Wait.routeName:
      return MaterialPageRoute(builder: (context) => const Wait());
    case Loading.routeName:
      return MaterialPageRoute(builder: (context) => const Loading());
    default:
      return MaterialPageRoute(
        builder: (contex) => const Scaffold(
          body: Center(
            child: Text(
              "Page Not Nound",
              style: TextStyle(
                color: ConstColor.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
  }
}
