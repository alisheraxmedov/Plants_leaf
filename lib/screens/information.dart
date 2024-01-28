import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_crops/screens/upload.dart';
import 'package:healthy_crops/widgets/youtube.dart';

class Information extends StatefulWidget {
  static const String routeName = "/information";

  const Information({
    super.key,
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 20,
        centerTitle: true,
        title: Text(
          "Qo'yilgan Tashxis",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.green.shade300,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/leaf2.jpg"),
          ),
        ),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).width * 0.01),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Column(
                  children: [
                    ListTile(
                      tileColor: Colors.green.shade400,
                      title: Text(
                        data!["bashorat"].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: MediaQuery.sizeOf(context).width * 0.07,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "ehtimolligi: ${data?["ehtimolligi"] ?? "90.92%"}",
                        style: GoogleFonts.openSans(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Card(
                  color: Colors.green.shade400,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        data!["maslahat"].toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Card(
                  color: Colors.green.shade400,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Davolash Usullari",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width*0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      YouTube(
                        videoUrl: data!["urll"].toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
