import 'package:flutter/material.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class TrendingText extends StatelessWidget {
  static const double kFontSize = 41;
  static const double kEmojiSize = 35;
  static const double kGlowRadius = 28;
  static const double kGlowSize = 18;
  static const kGlowColor = Color(0xFFF8B93F);
  static const kLeftGradientColor = Color(0xFFF8B93F);
  static const kRightGradientColor = Color(0xFFCD2029);

  const TrendingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // trending text
        GradientText(
          "Trending Today",
          style: const TextStyle(
            fontSize: kFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: "San Serif",
          ),
          colors: const [
            kLeftGradientColor,
            kRightGradientColor,
          ],
        ),

        // glowing fire emoji
        Stack(
          alignment: Alignment.center,
          children: [
            // fire emoji
            const Text(
              ' 🔥',
              style: TextStyle(
                fontSize: kEmojiSize,
              ),
            ),

            // fire glow
            Container(
              width: kGlowSize,
              height: kGlowSize,
              foregroundDecoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow (
                    color: kGlowColor,
                    offset: Offset(0, 10),
                    blurRadius:kGlowRadius,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}