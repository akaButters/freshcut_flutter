import 'package:flutter/material.dart';

import 'playlist_card_content.dart';
import '../../../model/card_info.dart';

class PlayListCard extends StatelessWidget {
  static const double kCardHeight = 425;
  static const double kCardWidth = 365;
  static const double kCardCornerRadius = 32;
  static const double kOuterGlowRadius = 25;
  static const kInnerCardColor = Color(0xFF101010);
  static const kTopRightCornerColor = Color(0x17FFFFFF);
  static const kBottomRightCornerColor = Color(0xFF0E0E0E);

  final CardInfo cardInfo;

  const PlayListCard({
    Key? key,
    required this.cardInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _gradientCorner({
      required double width,
      required double height,
      required Alignment center,
      required double gradientRadius,
      required Color startColor,
      required Color endColor,
      required double cornerRadius,
      Widget? child,
    }) {
      return Container(
        width: width,
        height: height,

        decoration: BoxDecoration(

          gradient: RadialGradient(
            center: center,
            radius: gradientRadius,
            colors: [startColor, endColor],
          ),

          // rounded corners
          borderRadius: BorderRadius.all(
            Radius.circular(cornerRadius),
          ),
        ),

        child: child,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        // outer glow
        Container(
          width: kCardWidth,
          height: kCardHeight,

          decoration: BoxDecoration(
            boxShadow: [
              // outer glow towards the upper left
              BoxShadow (
                color: cardInfo.outerGlowColor,
                offset: const Offset(-12, -6),
                blurRadius: kOuterGlowRadius,
              ),
            ],
          ),
        ),

        // top left corner gradient
        _gradientCorner(
            width: kCardWidth, height: kCardHeight, center: const Alignment(-1.2, -0.65), gradientRadius: 0.9,
            startColor: cardInfo.cardEdgeColor, endColor: kInnerCardColor, cornerRadius: kCardCornerRadius),

        // top right corner gradient
        _gradientCorner(
            width: kCardWidth, height: kCardHeight, center: const Alignment(1.0, -1.0), gradientRadius: 0.7,
            startColor: kTopRightCornerColor, endColor: Colors.transparent, cornerRadius: kCardCornerRadius),

        // bottom right corner gradient
        _gradientCorner(
            width: kCardWidth, height: kCardHeight, center: const Alignment(1.0, 1.0), gradientRadius: 0.7,
            startColor: kBottomRightCornerColor, endColor: Colors.transparent, cornerRadius: kCardCornerRadius),

        // 1 pixel inset gradient & inner content
        _gradientCorner(
            width: kCardWidth-2, height: kCardHeight-3, center: const Alignment(-1.0, -0.8), gradientRadius: 1.1,
            startColor: cardInfo.cardInnerColor, endColor: kInnerCardColor, cornerRadius: kCardCornerRadius,
            child: PlayListCardContent(cardInfo: cardInfo),
        ),
      ],
    );
  }
}