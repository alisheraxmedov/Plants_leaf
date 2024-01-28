import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthy_crops/screens/loading.dart';
import 'package:healthy_crops/screens/upload.dart';
import 'package:healthy_crops/widgets/text.dart';
import 'package:http/http.dart' as http;

class ScanningImageAnimation extends StatefulWidget {
  final File imagePath;
  const ScanningImageAnimation({
    super.key,
    required this.imagePath,
  });

  @override
  State<ScanningImageAnimation> createState() => _ScanningImageAnimationState();
}

class _ScanningImageAnimationState extends State<ScanningImageAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage("assets/leaf2.jpg"),
          // ),
          // color: Colors.green.shade900,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green,
              Colors.green.shade600,
              Colors.green.shade700,
              Colors.green.shade800,
              Colors.green.shade900,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.03,
            ),
            child: Image.file(widget.imagePath),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: BottomAppBar(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload,
                size: 40.0,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .003,
              ),
              const TextWidget(
                data: "Analizlash",
              ),
            ],
          ),
        ),
        onTap: () async {
          uploadImage();
          Navigator.pushNamed(context, Loading.routeName);
        },
      ),
    );
  }

  Future<void> uploadImage() async {
    try {
      if (pickedImage == null) {
        print('Please pick an image first.');
        return;
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://6895-86-62-2-178.ngrok-free.app/predict'),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          pickedImage!.path,
        ),
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String imageUrl = await response.stream.bytesToString();
        Map<String, dynamic> apiData = json.decode(imageUrl);
        setState(() {
          imageUrl = imageUrl;
          data = apiData;
        });
        print("data: $apiData");
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
