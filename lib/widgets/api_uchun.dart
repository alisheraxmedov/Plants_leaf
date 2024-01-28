// import 'package:flutter/material.dart';
// import 'package:healthy_crops/consts/colors.dart';
// import 'package:healthy_crops/widgets/text.dart';

// class AAAAAAAAAA extends StatelessWidget {
//   const AAAAAAAAAA({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder(
//       future: sendFileAndGetLeaf(_selectedImage),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const ConnectivityCheck();
//         }

//         List<LeafsModel> lsLeafs = snapshot.data!;

//         return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: ConstColor.darkColor,
//             title: const TextWidget(
//               data: "Welcome with App",
//             ),
//           ),
//           body: Container(
//             height: MediaQuery.sizeOf(context).height,
//             width: MediaQuery.sizeOf(context).width,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   "assets/leaf2.jpg",
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: getGaleryData,
//                   child: const TextWidget(
//                     data: "Galery",
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 ElevatedButton(
//                   onPressed: getCameraData,
//                   child: const TextWidget(
//                     data: "Camera",
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
// _selectedImage != null
//     ? SizedBox(
//         width: MediaQuery.sizeOf(context).width * .5,
//         child: Image.file(_selectedImage!))
//     : const SizedBox(),
//                 Text(lsLeafs[0].ehtimollik),
//                 Text(lsLeafs[0].kasallikNomi),
//                 Text(lsLeafs[0].maslahat),
//                 ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {},
//             shape: const CircleBorder(),
//             backgroundColor: ConstColor.darkColor,
//             child: const Icon(
//               Icons.send,
//               color: ConstColor.white,
//             ),
//           ),
//         );
//       },
//     );

//   }
// }

