// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YouTube extends StatelessWidget {
//   final String videoId;
//   const YouTube({super.key,
//   required this.videoId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: YoutubePlayer(
//         controller: YoutubePlayerController(
//           initialVideoId: videoId,
//           flags: const YoutubePlayerFlags(
//             autoPlay: true,
//             mute: false,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTube extends StatelessWidget {
  final String videoUrl;
  
  const YouTube({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
      ),
    );
  }
}
