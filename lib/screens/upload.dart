import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_crops/widgets/image.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

//============ global varriables ============
File? pickedImage;
String? imageUrl;
File? imageFile;
Map<String, dynamic>? data;

class Upload extends StatefulWidget {
  static const String routeName = "/upload";
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return pickedImage == null
        ? Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/leaf2.jpg",
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Iltimos rasmni belgilang!",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.sizeOf(context).width * .07,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(
                        Icons.camera,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      title: const Text(
                        "Kamera",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onTap: pickImageCamera,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      title: const Text(
                        "Galery",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onTap: pickImageGalery,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ScanningImageAnimation(imagePath: pickedImage!);
  }

  Future<void> pickImageGalery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          pickedImage = File(pickedFile.path);
        }
      },
    );
  }

  Future<void> pickImageCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(
      () {
        if (pickedFile != null) {
          pickedImage = File(pickedFile.path);
        }
      },
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
