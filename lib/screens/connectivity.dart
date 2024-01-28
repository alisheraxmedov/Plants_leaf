// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:healthy_crops/screens/upload.dart';
import 'package:healthy_crops/service/no_internet.dart';

class ConnectivityCheck extends StatefulWidget {
  static const String routeName = "/conn";
  const ConnectivityCheck({super.key});

  @override
  _ConnectivityCheckState createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isConnected = true; // Assume connected initially

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _checkConnection();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? const Upload() : const Wait();
  }
}
