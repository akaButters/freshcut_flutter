import 'package:flutter/material.dart';

class DiscordButton extends StatelessWidget {
  static const double kLargeFontSize = 23;
  static const double kDicordIconSize = 32;
  static const double kButtonBorderSize = 1;
  static const double kButtonWidth = 360;
  static const double kButtonHeight = 70;
  static const double kRoundedCornerRadius = 52;
  static const kLargeFontColor = Colors.white;
  static const kTopGradientColor = Color(0xFF715B29);
  static const kBottomGradientColor = Color(0xFF0D0D0A);
  static const kButtonBorderColor = Color(0xFF3C2A08);

  const DiscordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // circle outline
        Container(
          width: kButtonWidth,
          height: kButtonHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(kRoundedCornerRadius),
            ),

            border: Border.all(
              color: kButtonBorderColor,
              width: kButtonBorderSize,
            ),

            gradient: const LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [
                kTopGradientColor,
                kBottomGradientColor
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/discord.png',
                width: kDicordIconSize,
                height: kDicordIconSize,
              ),

              const Text(
                '  Join Metaview Discord',
                style: TextStyle(
                  fontSize: kLargeFontSize,
                  color: kLargeFontColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
