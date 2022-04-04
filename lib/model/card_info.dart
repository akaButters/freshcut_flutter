import 'dart:core';

import 'package:flutter/material.dart';

enum ProgressAmount {
  none,
  half,
  full,
}

class CardInfo {
  final String pictureName;
  final Color cardEdgeColor;
  final Color cardInnerColor;
  final Color outerGlowColor;
  final String cardTitle;
  final int newVideos;
  final bool newVideosGreyed;
  final int videosSeen;
  final int videosTotal;
  final bool seenVideosGreyed;
  final ProgressAmount progress;

  CardInfo({
    required this.pictureName,
    required this.cardEdgeColor,
    required this.cardInnerColor,
    required this.outerGlowColor,
    required this.cardTitle,
    required this.newVideos,
    required this.newVideosGreyed,
    required this.videosSeen,
    required this.videosTotal,
    required this.seenVideosGreyed,
    required this.progress,
  });
}

final contentCards = [
  CardInfo(
      pictureName: 'images/yellow.png',
      cardEdgeColor: const Color(0xFFBB993F), cardInnerColor: const Color(0xFF4D4225), outerGlowColor: const Color(0xA9392904),
      cardTitle: 'Smash Stockpile',
      newVideos: 10, newVideosGreyed: false,
      videosSeen: 15, videosTotal: 30, seenVideosGreyed: true, progress: ProgressAmount.half
  ),

  CardInfo(
    pictureName: 'images/purple.png',
    cardEdgeColor: const Color(0xFF6D378B), cardInnerColor: const Color(0xFF341843), outerGlowColor: const Color(0xA92B0041),
    cardTitle: 'FGC Rumble',
    newVideos: 18, newVideosGreyed: false,
    videosSeen: 0, videosTotal: 18, seenVideosGreyed: false, progress: ProgressAmount.none
  ),

  CardInfo(
    pictureName: 'images/red.png',
    cardEdgeColor: const Color(0xFF7F2830), cardInnerColor: const Color(0xFF411417), outerGlowColor: const Color(0xA9330004),
    cardTitle: 'Valorant Volume',
    newVideos: 21, newVideosGreyed: true,
    videosSeen: 21, videosTotal: 21, seenVideosGreyed: true, progress: ProgressAmount.full
  ),
];