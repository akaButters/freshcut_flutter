import 'package:flutter/material.dart';

class VideosSeenText extends StatelessWidget {
  static const kGreyText = Color(0x90C4C4C4);
  static const kYellowText = Color(0xFFEDB030);
  static const double kFontSize = 16;
  static const double kTextRowWidth = 320;

  final int newVideos;
  final bool newVideosGreyed;
  final int videosSeen;
  final int videosTotal;
  final bool seenVideosGreyed;

  const VideosSeenText({
    Key? key,
    required this.newVideos,
    required this.newVideosGreyed,
    required this.videosSeen,
    required this.videosTotal,
    required this.seenVideosGreyed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kTextRowWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // new videos text
          Text(
            '+$newVideos New Videos',
            style: TextStyle(
              fontSize: kFontSize,
              color: (newVideosGreyed) ? kGreyText : kYellowText,
            ),
          ),

          const Spacer(),

          // seen videos text
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: (seenVideosGreyed) ? kGreyText : kYellowText,
                size: kFontSize + 1,
              ),
              Text(
                ' $videosSeen/$videosTotal',
                style: TextStyle(
                  fontSize: kFontSize,
                  color: (seenVideosGreyed) ? kGreyText : kYellowText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
