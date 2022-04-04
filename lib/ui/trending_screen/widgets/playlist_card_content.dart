import 'package:flutter/material.dart';

import './progress_bar_stack.dart';
import './play_button.dart';
import './videos_seen_text.dart';
import '../../../model/card_info.dart';

class PlayListCardContent extends StatelessWidget {
  static const double kCardTitleFontSize = 26;
  static const double kPictureWidth = 337;
  static const double kPictureHeight = 288;
  static const double kPictureCornerRadius = 20;
  static const double kLeftSideTextPosition = 21;
  static const double kTitleTextYPosition = 320;
  static const double kNewVideosTextYPosition = 356;
  static const double kProgressBarYPosition = 385;
  static const double kPlayButtonXPosition = 259;
  static const double kPlayButtonYPosition = 270;
  static const kTitleTextColor = Colors.white;

  final CardInfo cardInfo;

  const PlayListCardContent({
    Key? key,
    required this.cardInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        // picture
        Container(
          width: kPictureWidth,
          height: kPictureHeight,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(kPictureCornerRadius),
            ),

            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                cardInfo.pictureName,
              ),
            ),
          ),
        ),

        // play button
        const Positioned(
          left: kPlayButtonXPosition,
          top: kPlayButtonYPosition,
          child: PlayButton(),
        ),

        // title text
        Positioned(
          left: kLeftSideTextPosition,
          top: kTitleTextYPosition,
          child: Text(
            cardInfo.cardTitle,
            style: const TextStyle(
              fontSize: kCardTitleFontSize,
              fontWeight: FontWeight.w700,
              color: kTitleTextColor,
            ),
          ),
        ),

        // new videos / seen videos text
        Positioned(
          left: kLeftSideTextPosition,
          top: kNewVideosTextYPosition,
          child: VideosSeenText(
              newVideos: cardInfo.newVideos, newVideosGreyed: cardInfo.newVideosGreyed,
              videosSeen: cardInfo.videosSeen, videosTotal: cardInfo.videosTotal, seenVideosGreyed: cardInfo.seenVideosGreyed,
          ),
        ),

        // progress bar
        Positioned(
          left: kLeftSideTextPosition,
          top: kProgressBarYPosition,
          child: ProgressBarStack(progressAmount: cardInfo.progress),
        ),
      ],
    );
  }
}