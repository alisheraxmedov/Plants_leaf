import 'package:flutter/material.dart';
import 'package:healthy_crops/route.dart';

void main() {
  runApp(
    const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      // home: ScannerScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
