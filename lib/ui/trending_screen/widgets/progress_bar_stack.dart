import 'package:flutter/material.dart';

import './progress_bar.dart';
import '../../../../model/card_info.dart';

class ProgressBarStack extends StatelessWidget {
  static const double kProgressBarWidth = 320;
  static const double kProgressBarHalfWidth = 170;
  static const double kProgressBarHeight = 5;
  static const double kProgressBarHeightEnlarger = 25;
  static const double kGlowRadius = 5;
  static const Color kGlowColor = Color(0x99EDB030);
  static const Color kGreyBackingColor = Color(0xFF2C2B2A);
  static const Color kYellowFrontColor = Color(0xFFEDB030);
  static const Color kHighlightColor = Color(0xDDFFFFFF);
  static const Color kExtraHighlightColor = Color(0x99FFFFFF);

  final ProgressAmount progressAmount;

  const ProgressBarStack({
    Key? key,
    required this.progressAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _yellowProgressWidth(ProgressAmount progressAmount) {
      switch (progressAmount) {
        case ProgressAmount.half:
          return kProgressBarHalfWidth;
        case ProgressAmount.full:
          return kProgressBarWidth;
        default:
          return 0;
      }
    }
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // clear enlarger backing
        const ProgressBar(
            width: kProgressBarWidth,
            height: kProgressBarHeightEnlarger,
            color: Colors.transparent,
            cornerRadius: kProgressBarHeight
        ),

        // grey progress backing
        const ProgressBar(
            width: kProgressBarWidth,
            height: kProgressBarHeight,
            color: kGreyBackingColor,
            cornerRadius: kProgressBarHeight
        ),

        // yellow progress bar
        ProgressBar(
          width: _yellowProgressWidth(progressAmount),
          height: kProgressBarHeight,
          color: kYellowFrontColor,
          cornerRadius: kProgressBarHeight,
          glowColor: kGlowColor,
          glowRadius: kGlowRadius,
        ),

        // progress bar highlight
        if (progressAmount == ProgressAmount.half)
        Positioned(
          left: kProgressBarHalfWidth - 6,
          child: Container(
            width: kProgressBarHeight + 2,
            height: kProgressBarHeight +2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow (
                  color: kHighlightColor,
                  blurRadius: kProgressBarHeight + 7,
                ),
                BoxShadow (
                  color: kExtraHighlightColor,
                  blurRadius: kProgressBarHeight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
