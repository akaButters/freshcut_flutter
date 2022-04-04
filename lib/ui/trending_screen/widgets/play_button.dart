import 'package:flutter/material.dart';

import 'package:blur/blur.dart';

class PlayButton extends StatelessWidget {
  static const double kInnerGlowRadius = 16;
  static const double kInnerGlowWidth = 30;
  static const double kBlurredCircleWidth = 67;
  static const double kBlurredCircleBlurAmount = 5;
  static const double kCircleBorderWidth = 1;
  static const double kBlurredCircleBorderRadius = 50;
  static const double kPlayIconSize = 50;
  static const double kButtonDarkShadowRadius = 12;
  static const kDarkShadowColor = Color(0x66000000);
  static const kInnerGlowColor = Color(0x99FFFFFF);
  static const kBlurredCircleBlurColor = Color(0xFF989895);
  static const kCircleBorderColor = Color(0x29FFFFFF);

  const PlayButton({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // blurred circle
        Container(
          width: kBlurredCircleWidth,
          height: kBlurredCircleWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: kCircleBorderWidth,
            ),

          ),
        ).blurred(
          blur: kBlurredCircleBlurAmount,
          blurColor: kBlurredCircleBlurColor,
          borderRadius: BorderRadius.circular(kBlurredCircleBorderRadius),
        ),

        // circle outline
        Container(
          width: kBlurredCircleWidth,
          height: kBlurredCircleWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            border: Border.all(
              color: kCircleBorderColor,
              width: kCircleBorderWidth,
            ),

            // dark drop shadow
            boxShadow: const [
              BoxShadow (
                color: kDarkShadowColor,
                blurRadius: kButtonDarkShadowRadius,
              ),
            ],
          ),

          // play triangle
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: kPlayIconSize,
          ),
        ),

        // white inner glow
        Container(
          width: kInnerGlowWidth,
          height: kInnerGlowWidth,
          foregroundDecoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow (
                color: kInnerGlowColor,
                blurRadius: kInnerGlowRadius,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
